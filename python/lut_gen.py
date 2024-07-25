import numpy as np

# Parameters
LUT_SIZE = 256  # Adjust size as needed
MAX_EXP_VALUE = 10  # Maximum value for which to compute exponentials

# Generate LUT values
def generate_exp_lut(size, max_value):
    exp_lut = np.zeros(size, dtype=np.uint16)  # Use appropriate dtype for your precision

    # Compute exponential values
    for i in range(size):
        # Map index to value (e.g., scaled from 0 to MAX_EXP_VALUE)
        value = (i / (size - 1)) * max_value
        exp_lut[i] = np.clip(np.exp(value) * (2**16), 0, 2**16 - 1)  # Scale to fit in uint16

    return exp_lut

# Save LUT to file
def save_lut_to_file(lut, filename):
    np.savetxt(filename, lut, fmt='%d')

# Generate and save the LUT
exp_lut = generate_exp_lut(LUT_SIZE, MAX_EXP_VALUE)
save_lut_to_file(exp_lut, 'exp_lut.txt')

print("Exponential LUT generated and saved.")
