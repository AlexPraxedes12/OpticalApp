@echo off
REM Create virtual environment with Python 3.10
"C:\Users\alexp\AppData\Local\Programs\Python\Python310\python.exe" -m venv onnx2tflite-env

REM Activate environment
call onnx2tflite-env\Scripts\activate

REM Update pip
python -m pip install --upgrade pip

REM Install all required dependencies
pip install tensorflow==2.12.0 onnx==1.15.0 onnx2tf==1.20.2 onnx-graphsurgeon psutil
pip install sng4onnx


REM Run script
python convert_onnx_to_tflite.py

pause
