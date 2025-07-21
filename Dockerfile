# Use a base image with OpenSSH server
FROM ubuntu:latest

# Install OpenSSH server
RUN apt-get update && apt-get install -y \
    openssh-server \
    bash \
    bash-completion \
    vim \
    curl \
    wget \
    less \
    iputils-ping \
    net-tools \
    procps \
    && apt-get clean

SHELL ["/bin/bash", "-c"]
RUN echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> /root/.bashrc
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /root/.bashrc

# Create a directory for SSH daemon runtime files
RUN mkdir /var/run/sshd

# Copy the public key into the authorized_keys file for the root user
# Ensure 'dockerkey.pub' exists in the same directory as the Dockerfile
COPY ./dockerkey.pub /root/.ssh/authorized_keys

# Set appropriate permissions for the authorized_keys file
RUN chmod 600 /root/.ssh/authorized_keys

# Expose the SSH port
EXPOSE 22

# Start the SSH daemon in the foreground
CMD ["/usr/sbin/sshd", "-D"]
