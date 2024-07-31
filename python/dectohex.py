# -*- coding: utf-8 -*-
"""
Created on Thu Jul 25 08:27:15 2024

@author: ferdek
"""

import numpy as np

def convert_decimal_to_hex(input_file, output_file):
    # Load the decimal values from the text file
    decimal_values = np.loadtxt(input_file, dtype=np.int16)

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
convert_decimal_to_hex('in_dp1.txt', '/generated_files/input_dropout1_hex.txt')



