#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 23 14:53:53 2024

@author: ferdziu10
"""

import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
import tensorflow_model_optimization as tfmot

# Ensure compatibility with TensorFlow 2.x
assert tf.__version__.startswith('2'), "This script requires TensorFlow 2.x"

# Load your pre-trained model
model = load_model('sound_classification_model.h5')

# Apply quantization aware training
quantize_model = tfmot.quantization.keras.quantize_model
q_aware_model = quantize_model(model)

# Compile the quantization-aware model
q_aware_model.compile(optimizer='adam',
                      loss='categorical_crossentropy',
                      metrics=['accuracy'])

# Load prepared data
X_train = np.load('X_train.npy')
X_test = np.load('X_test.npy')
y_train = np.load('y_train.npy')
y_test = np.load('y_test.npy')

# Encode labels for training
from tensorflow.keras.utils import to_categorical
y_train_categorical = to_categorical(y_train, num_classes=3)
y_test_categorical = to_categorical(y_test, num_classes=3)

# Train the model to be aware of quantization
q_aware_model.fit(X_train, y_train_categorical, batch_size=64, epochs=5, validation_data=(X_test, y_test_categorical))

# Save the quantized model
q_aware_model.save('quantized_sound_classification_model.h5')

# Evaluate the quantized model
loss, accuracy = q_aware_model.evaluate(X_test, y_test_categorical)
print(f"Quantized Model Test Loss: {loss}")
print(f"Quantized Model Test Accuracy: {accuracy}")
