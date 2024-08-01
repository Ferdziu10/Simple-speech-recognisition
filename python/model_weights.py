import numpy as np
from tensorflow.keras.models import load_model

# Load the trained model
model = load_model('sound_classification_model.h5')

# Get weights of the first dense layer
weights, biases = model.layers[6].get_weights()

# Quantize weights and biases (example using 8-bit quantization)
weights_q = np.round(weights * 32767).astype(np.int16)
biases_q = np.round(biases * 32767).astype(np.int16)

# Save weights and biases to a file
np.savetxt('dense24_weights.txt', weights_q, fmt='%d')
np.savetxt('dense24_biases.txt', biases_q, fmt='%d')

