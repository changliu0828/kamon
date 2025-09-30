FROM python:3.11.13-slim AS kamon

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone diffusers repository
RUN git clone https://github.com/huggingface/diffusers.git /app/diffusers

# Clone kamon repository
RUN git clone https://github.com/changliu0828/kamon.git /app/kamon

# Install diffusers and dependencies
RUN pip install --no-cache-dir /app/diffusers[torch]

# Install text_to_image example requirements
RUN pip install --no-cache-dir -r /app/diffusers/examples/text_to_image/requirements.txt

# Upgrade peft to meet version requirement
RUN pip install --no-cache-dir "peft>=0.17.0"

# Default command
CMD ["bash"]
