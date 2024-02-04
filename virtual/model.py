
from transformers import pipeline
classifier = pipeline("sentiment-analysis", model="20wds/my_awesome_model")

def isScam(text):
    result = classifier(text)
    print(result)
    if result[0]["score"] > .97 and result[0]["label"] == "POSITIVE":
        return True
    else:
        return False

# isScam("Test")