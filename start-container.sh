#!/usr/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE_NAME=azhu0511/gpt-sovits:latest
LAUNCH_FILE=/workspace/GPT_SoVITS/inference_webui_az.py
docker run --rm -it --gpus=all \
    --env is_half=False \
    --env LC_ALL=zh_CN.UTF-8 \
    --volume "$DIR"/output:/workspace/output \
    --volume "$DIR"/logs:/workspace/logs \
    --volume "$DIR"/SoVITS_weights:/workspace/SoVITS_weights \
    --volume "$DIR"/GPT_weights:/workspace/GPT_weights \
    --workdir /workspace \
    -p 9880:9880 -p 9871:9871 -p 9872:9872 -p 9873:9873 -p 9874:9874 \
    --shm-size=16g \
    $IMAGE_NAME \
    python "$LAUNCH_FILE"