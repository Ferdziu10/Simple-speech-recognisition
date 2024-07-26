# -*- coding: utf-8 -*-
"""
Created on Thu Jul 25 08:27:15 2024

@author: ferdek
"""

import numpy as np

def convert_decimal_to_hex(input_file, output_file):
    # Load the decimal values from the text file
    decimal_values = np.loadtxt(input_file, dtype=np.int8)

    # Convert the loaded decimal values to hexadecimal
    with open(output_file, 'w') as f:
        if decimal_values.ndim == 1:  # If the array is 1D
            for val in decimal_values:
                # Convert value to hexadecimal and write it to the file
                hex_val = format(val if val >= 0 else (1 << 8) + val, '02x')
                f.write(f"{hex_val}\n")
        elif decimal_values.ndim == 2:  # If the array is 2D
            for row in decimal_values:
                hex_row = [format(val if val >= 0 else (1 << 8) + val, '02x') for val in row]
                f.write(" ".join(hex_row) + "\n")
        else:
            raise ValueError("Unsupported number of dimensions for conversion.")

# Convert and save the weights
convert_decimal_to_hex('dense11_weights.txt', 'dense11_weights_hex.txt')

# Convert and save the biases
convert_decimal_to_hex('dense11_biases.txt', 'dense11_biases_hex.txt')

# Convert and save the second dense layer weights
convert_decimal_to_hex('dense12_weights.txt', 'dense22_weights_hex.txt')

# Convert and save the second dense layer biases
convert_decimal_to_hex('dense12_biases.txt', 'dense22_biases_hex.txt')

# Convert and save the third dense layer weights
convert_decimal_to_hex('dense13_weights.txt', 'dense33_weights_hex.txt')

# Convert and save the third dense layer biases
convert_decimal_to_hex('dense13_biases.txt', 'dense33_biases_hex.txt')

# Convert and save the fourth dense layer weights
convert_decimal_to_hex('dense14_weights.txt', 'dense44_weights_hex.txt')

# Convert and save the fourth dense layer biases
convert_decimal_to_hex('dense14_biases.txt', 'dense44_biases_hex.txt')

