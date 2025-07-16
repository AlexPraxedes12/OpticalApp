from onnx2tf import convert
import os

onnx_path = "model.onnx"
output_dir = "converted_model"

# Crear carpeta de salida si no existe
os.makedirs(output_dir, exist_ok=True)

# Cambiar temporalmente al directorio de salida
os.chdir(output_dir)

# Conversión sin parámetros adicionales
convert(
    input_onnx_file_path=os.path.join("..", onnx_path)
)

print(f"✅ Conversión completada. Archivos generados en: {output_dir}")
