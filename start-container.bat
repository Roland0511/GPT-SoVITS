@echo off

@REM get the script directory
set SCRIPT_DIR=%~dp0
set IMAGE_NAME=azhu0511/gpt-sovits:latest
set LAUNCH_FILE="%SCRIPT_DIR%\GPT_SoVITS\inference_webui_az.py"
echo inference server will running at http://localhost:9872/


@REM run the container
docker run --rm -it --gpus=all ^
--env is_half=False ^
--env LC_ALL=zh_CN.UTF-8 ^
--volume=%SCRIPT_DIR%\output:/workspace/output ^
--volume=%SCRIPT_DIR%\logs:/workspace/logs ^
--volume=%SCRIPT_DIR%\SoVITS_weights:/workspace/SoVITS_weights ^
--volume=%SCRIPT_DIR%\GPT_weights:/workspace/GPT_weights ^
--workdir=/workspace ^
-p 9880:9880 -p 9871:9871 -p 9872:9872 -p 9873:9873 -p 9874:9874 ^
--shm-size="16G" ^
%IMAGE_NAME% ^
python %LAUNCH_FILE%