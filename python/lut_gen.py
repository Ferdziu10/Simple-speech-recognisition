import numpy as np

# Define the range of inputs for the LUT
input_range = np.arange(-128, 128, dtype=np.int16)

# Generate the exponential values
# Here, we'll scale the input range to avoid overflow in np.exp
# In practice, you'd use a suitable function or approximation
exp_values = np.exp(input_range / 32.0) * (2**8)  # Scale and convert to fixed-point
exp_values = np.clip(exp_values, 0, 65535).astype(np.uint16)  # Ensure values fit in 16-bit

# Convert to hexadecimal format and save to a file
with open('exp_lut.mem', 'w') as f:
    for val in exp_values:
        hex_val = format(val, '04x')  # 16-bit hexadecimal
        f.write(f"{hex_val}\n")

print("LUT saved to exp_lut.mem")
