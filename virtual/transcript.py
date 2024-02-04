import speech_recognition as sr
from pydub import AudioSegment
import os
import threading
import time
from flask import Flask
import json
import io
import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage
from model import isScam

cred = credentials.Certificate('virtual/call-safe-firebase-adminsdk-u86zu-5aba86934f.json')

app = firebase_admin.initialize_app(cred, {'storageBucket': 'gs://call-safe.appspot.com'})

bucket_name = "call-safe.appspot.com"

download_directory = "QHacksPyScript/audio_files"

# # Fetch the service account key JSON file contents
# cred = credentials.Certificate('call-safe-firebase-adminsdk-u86zu-5aba86934f.json')
# # Initialize the app with a service account, granting admin privileges
# app = firebase_admin.initialize_app(cred)

# db = firestore.client()
app = Flask(__name__)

def download_new_files():
    bucket = storage.bucket(bucket_name)
    blobs = bucket.list_blobs()

    for blob in blobs:
        local_file_path = os.path.join(download_directory, blob.name)

        os.makedirs(os.path.dirname(local_file_path), exist_ok=True)
        if not os.path.exists(local_file_path):
            blob.download_to_filename(local_file_path)
            print(f"Downloaded file: {blob.name}")
    return

        
def periodic_task():
    while True:
        download_new_files()
        time.sleep(10)  # sleep for 5 minutes


def detect_silence(audio_segment, thresh=-30, silence_len=500):
    silence = [start for start in range(len(audio_segment))
               if audio_segment[start:start + silence_len].dBFS < thresh]
    return [start for start in silence if start == silence[0] or start - silence[silence.index(start) - 1] > silence_len]

def split_on_silence(audio_segment, pause_indices):
    segments = []
    start = 0
    for pause in pause_indices:
        startPad = max(0, start - 400)  # Ensures start is not negative
        endPad = min(len(audio_segment), pause + 400)
        segments.append(audio_segment[startPad:endPad])
        start = pause
    segments.append(audio_segment[start:])
    return segments

@app.route("/")
# def trigger_download():
#     return "Download triggered successfully"
def detectScam():
    download_new_files()

    print("in detect scam")

    audio = AudioSegment.from_wav("scam.wav")
    r = sr.Recognizer()

    # Detect pauses in the audio file
    pause_indices = detect_silence(audio)

    # Split the audio file on detected pauses
    segments = split_on_silence(audio, pause_indices)

    
    complete_transcript = ""

    for i, segment in enumerate(segments):
        with io.BytesIO() as audio_io:
            segment.export(audio_io, format="wav")
            audio_io.seek(0)
            with sr.AudioFile(audio_io) as source:
                audio = r.record(source)
        try:
            transcript = r.recognize_google(audio)
            complete_transcript += f"{transcript}"
        except sr.UnknownValueError:
            complete_transcript += f"[Unrecognized Audio]"
        except sr.RequestError as e:
            complete_transcript += f"[Request Failed: {e}]"
        

    print("complete_transcript",complete_transcript)
    result = isScam(complete_transcript)
    return json.dumps({"result":result, "transcript":complete_transcript})

if __name__ == '__main__':
     
    threading.Thread(target=periodic_task).start()
    # Run the Flask application
    app.run(debug=False, host='127.0.0.1', port=5000)

