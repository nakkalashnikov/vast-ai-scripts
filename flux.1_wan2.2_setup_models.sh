#!/bin/bash

echo '=== Starting FLUX.1 and Wan2.2 models download ==='

# Check if HF_TOKEN is provided from Vast.ai environment
if [ -z '${HF_TOKEN:-}' ]; then
    echo 'WARNING: HF_TOKEN is not set in environment variables! FLUX VAE download will fail.'
else
    echo 'HF_TOKEN found, proceeding with authentication.'
fi

# ==========================================
# 1. FLUX.1
# ==========================================

echo 'Downloading FLUX VAE...'
wget --header='Authorization: Bearer '$HF_TOKEN -c 'https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors' -O '/workspace/ComfyUI/models/vae/ae.safetensors'

echo 'Downloading FLUX CLIP encoders...'
wget -c 'https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors' -O '/workspace/ComfyUI/models/clip/clip_l.safetensors'
wget -c 'https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors' -O '/workspace/ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors'

echo 'Downloading FLUX UNET FP8 (~11.6 GB)...'
wget -c 'https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-dev-fp8.safetensors' -O '/workspace/ComfyUI/models/unet/flux1-dev-fp8.safetensors'

# ==========================================
# 2. WAN 2.2 (Video)
# ==========================================

echo 'Downloading Wan VAE...'
wget -c 'https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors' -O '/workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors'

echo 'Downloading Wan CLIP...'
wget -c 'https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors' -O '/workspace/ComfyUI/models/clip/umt5_xxl_fp8_e4m3fn_scaled.safetensors'

echo 'Downloading Wan UNET High Noise (~14.3 GB)...'
wget -c 'https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors' -O '/workspace/ComfyUI/models/unet/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors'

echo 'Downloading Wan UNET Low Noise (~14.3 GB)...'
wget -c 'https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors' -O '/workspace/ComfyUI/models/unet/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors'

echo '=== All models downloaded successfully! ==='
