import numpy as np
import librosa
from tensorflow.keras.models import load_model
import os

def extract_features(file_path):
    try:
        y, sr = librosa.load(file_path, sr=None)
        mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
        mfccs_mean = np.mean(mfccs, axis=1)
        mfccs_std = np.std(mfccs, axis=1)
        return np.concatenate([mfccs_mean, mfccs_std])
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return None

def predict(file_path, model):
    feature = extract_features(file_path)
    if feature is not None:
        feature = np.expand_dims(feature, axis=0)
        prediction = model.predict(feature)
        return np.argmax(prediction)
    else:
        return None

# Load the trained model
model = load_model('sound_classification_model.h5')

# Path to the new audio file
file_path = '/Users/Ferdziu10/Desktop/WAV/on_test.wav'  # Upewnij się, że plik istnieje w tej lokalizacji

# Predict
if os.path.exists(file_path):
    prediction = predict(file_path, model)
    if prediction is not None:
        print(f'Predicted class: {"on" if prediction == 0 else "off"}')
    else:
        print("Error in feature extraction")
else:
    print("Plik nie istnieje. Sprawdź ścieżkę.")
