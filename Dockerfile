FROM python:3.12.3

WORKDIR /media/rishu33/ACTIVE_DATA/RWTH/docker/deeplearning_pytorch

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt /media/rishu33/ACTIVE_DATA/RWTH/docker/deeplearning_pytorch

# Upgrade pip and install dependencies
RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

# Copy the rest of the application
COPY . /media/rishu33/ACTIVE_DATA/RWTH/docker/deeplearning_pytorch

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]