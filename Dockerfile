
FROM ubuntu:22.04

# Update package lists and upgrade existing packages
RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y wget unzip

# Download and extract Telegram Desktop
RUN wget https://updates.tdesktop.com/tlinux/tsetup.3.8.8.tar.xz && \
    tar xf tsetup.3.8.8.tar.xz && \
    mv Telegram/Telegram /usr/local/bin/telegram-desktop && \
    rm -rf Telegram tsetup.3.8.8.tar.xz

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /home/user

# Expose the port for GUI access
EXPOSE 16000

# Run Telegram Desktop
CMD ["telegram-desktop"]
