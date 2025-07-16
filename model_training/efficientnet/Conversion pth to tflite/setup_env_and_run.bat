@echo off
REM Crear entorno virtual con Python 3.10
"C:\Users\alexp\AppData\Local\Programs\Python\Python310\python.exe" -m venv onnx2tflite-env

REM Activar entorno
call onnx2tflite-env\Scripts\activate

REM Actualizar pip
python -m pip install --upgrade pip

REM Instalar todas las dependencias necesarias
pip install tensorflow==2.12.0 onnx==1.15.0 onnx2tf==1.20.2 onnx-graphsurgeon psutil
pip install sng4onnx


REM Ejecutar script
python convert_onnx_to_tflite.py

pause
