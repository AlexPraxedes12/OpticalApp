from onnx2tf import convert
import os

onnx_path = "model.onnx"
output_dir = "converted_model"

# Create output directory if it doesn't exist
os.makedirs(output_dir, exist_ok=True)

# Temporarily change to the output directory
os.chdir(output_dir)

# Conversion without additional parameters
convert(
    input_onnx_file_path=os.path.join("..", onnx_path)
)

print(f"✅ Conversión completada. Archivos generados en: {output_dir}")
