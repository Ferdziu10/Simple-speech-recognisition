import numpy as np

# Define the range of inputs for the LUT
# Here we assume the input range of -128 to 127 with finer granularity
input_range = np.linspace(-128, 127, 2**20, dtype=np.float64)  # 1,048,576 entries

# Generate the exponential values
exp_values = np.exp(input_range) * (2**32)  # Scale and convert to fixed-point
exp_values = np.clip(exp_values, 0, 2**40 - 1).astype(np.uint64)  # Ensure values fit in 40-bit

# Convert to hexadecimal format and save to a file
with open('lut_40bit_large.mem', 'w') as f:
    for val in exp_values:
        hex_val = format(val, '010x')  # 40-bit hexadecimal
        f.write(f"{hex_val}\n")
import numpy as np

# Define the range of inputs for the LUT
# Here we assume the input range of -128 to 127 with finer granularity
input_range = np.linspace(-128, 127, 2**20, dtype=np.float64)  # 1,048,576 entries

# Generate the exponential values
exp_values = np.exp(input_range) * (2**32)  # Scale and convert to fixed-point
exp_values = np.clip(exp_values, 0, 2**40 - 1).astype(np.uint64)  # Ensure values fit in 40-bit

# Convert to hexadecimal format and save to a file
with open('lut_40bit_large.mem', 'w') as f:
    for val in exp_values:
        hex_val = format(val, '010x')  # 40-bit hexadecimal
        f.write(f"{hex_val}\n")
