#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 23 14:51:19 2024

@author: ferdziu10
"""

import os
import numpy as np
import librosa
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split

def extract_features(file_path):
    try:
        y, sr = librosa.load(file_path, sr=None)
        # Ekstrakcja cech MFCC (Mel Frequency Cepstral Coefficients)
        mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
        # Oblicz średnią i odchylenie standardowe z MFCC
        mfccs_mean = np.mean(mfccs, axis=1)
        mfccs_std = np.std(mfccs, axis=1)
        return np.concatenate([mfccs_mean, mfccs_std])
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return None

def load_data(input_folder):
    features = []
    labels = []

    for label in ['on', 'off']:
        folder = os.path.join(input_folder, label)
        for file_name in os.listdir(folder):
            if file_name.endswith('.wav'):
                file_path = os.path.join(folder, file_name)
                feature = extract_features(file_path)
                if feature is not None:
                    features.append(feature)
                    labels.append(label)

    return np.array(features), np.array(labels)

input_folder = '/Users/Ferdziu10/Desktop/WAV'
X, y = load_data(input_folder)

# Encoding labels
le = LabelEncoder()
y_encoded = le.fit_transform(y)

# Splitting data
X_train, X_test, y_train, y_test = train_test_split(X, y_encoded, test_size=0.2, random_state=42)

# Save data for later use
np.save('X_train.npy', X_train)
np.save('X_test.npy', X_test)
np.save('y_train.npy', y_train)
np.save('y_test.npy', y_test)
