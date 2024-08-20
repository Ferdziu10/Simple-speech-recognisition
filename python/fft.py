import numpy as np

def twos_complement(value, bit_width):
    """Convert an integer to its two's complement equivalent."""
    if value < 0:
        value = (1 << bit_width) + value
    return value

def inverse_twos_complement(value, bit_width):
    """Convert a two's complement number back to a regular integer."""
    if value & (1 << (bit_width - 1)):
        value = value - (1 << bit_width)
    return value

def fft_12bit(input_data):
    """Perform FFT on 12-bit signed integer input data."""
    N = 256  # FFT size
    if len(input_data) != N:
        raise ValueError("Input data must have exactly 256 points.")

    # Convert input data to complex numbers with imaginary part = 0
    input_complex = np.array([inverse_twos_complement(x, 12) for x in input_data], dtype=np.complex64)

    # Perform FFT
    fft_result = np.fft.fft(input_complex)

    # Extract real and imaginary parts and convert them to 12-bit integers
    real_part = np.real(fft_result).astype(np.int16)
    imag_part = np.imag(fft_result).astype(np.int16)

    # Clip the real and imaginary parts to fit within 12-bit signed integer range
    real_part_clipped = np.clip(real_part, -2048, 2047)
    imag_part_clipped = np.clip(imag_part, -2048, 2047)

    # Convert back to two's complement format
    real_part_12bit = [twos_complement(int(val), 12) for val in real_part_clipped]
    imag_part_12bit = [twos_complement(int(val), 12) for val in imag_part_clipped]

    return real_part_12bit, imag_part_12bit

# Example test
if __name__ == "__main__":
    # Generate example 12-bit input data (values between -2048 and 2047)
    input_data = np.random.randint(-2048, 2048, size=256).tolist()

    # Perform FFT
    real_output, imag_output = fft_12bit(input_data)

    # Display the output
    print("Real part (12-bit):", real_output)
    print("Imaginary part (12-bit):", imag_output)
