import sys, struct, os

# Expect input binary file path as first argument, output hex file path as second argument
if len(sys.argv) != 3:
    print('Usage: python bin2hex.py <input.bin> <output.hex>')
    sys.exit(1)

bin_path = sys.argv[1]
hex_path = sys.argv[2]

if not os.path.isfile(bin_path):
    print(f'Error: {bin_path} not found')
    sys.exit(1)

with open(bin_path, 'rb') as f_bin, open(hex_path, 'w') as f_hex:
    while True:
        word_bytes = f_bin.read(4)
        if not word_bytes:
            break
        # Pad if less than 4 bytes (unlikely for program)
        if len(word_bytes) < 4:
            word_bytes = word_bytes.ljust(4, b'\x00')
        # Little‑endian to integer
        word = struct.unpack('<I', word_bytes)[0]
        f_hex.write(f"{word:08x}\n")
print('Conversion completed')
