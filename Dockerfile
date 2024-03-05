FROM ubuntu:22.04

# Details about the image
LABEL org.opencontainers.image.title="Mini Project Image"
LABEL org.opencontainers.image.description="This image contains \
all the packages required for my University mini project preinstalled."
LABEL org.opencontainers.image.source="https://github.com/kbdharun/mini-project"
LABEL org.opencontainers.image.authors="K.B.Dharun Krishna mail@kbdharun.dev, et al."
LABEL org.opencontainers.image.vendor="kbdharun.dev"
LABEL org.opencontainers.image.licenses="MIT"

# Install Python, Pip and Git
RUN apt-get update && apt-get install -y python3 python3-pip git libopencv-dev python3-opencv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install Python packages from the requirements file
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Set the working directory
WORKDIR /app

# Command to run when the container starts
CMD ["/bin/sh"]
