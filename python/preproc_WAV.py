# -*- coding: utf-8 -*-
"""
Created on Fri Jul 26 11:23:29 2024

@author: Kacper
"""

import numpy as np
import scipy.io.wavfile as wav

def preprocess_wav(input_wav, output_file):
    # Read the WAV file
    sample_rate, data = wav.read(input_wav)

    # Normalize data to 8-bit signed integer range
    data = data / np.max(np.abs(data))  # Normalize to [-1, 1]
    data = np.int8(data * 127)  # Scale to [-128, 127]

    # Write data to a memory initialization file
    with open(output_file, 'w') as f:
        for sample in data:
            f.write(f"{sample:08b}\n")

# Preprocess the WAV file
preprocess_wav('WAV/test/off_test.wav', 'generated_files/input_vector.mem')
