import speech_recognition as sr
from pydub import AudioSegment
from os import path
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():


    # convert mp3 file to wav                                                       
    # sound = AudioSegment.from_mp3("sample-3.mp3")
    # sound.export("transcript.wav", format="wav")

    # Initialize recognizer class                                       
    r = sr.Recognizer()
    # audio object                                                         
    audio = sr.AudioFile("harvard.wav")
    #read audio object and transcribe
    with audio as source:
        audio = r.record(source)                  
        result = r.recognize_google(audio)
        
    print(result)
    return "<p>Hello, World!</p>"

