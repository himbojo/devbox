# Copy SSH Public Key to dockerkey.pub
cp .ssh/id_*.pub ./dockerkey.pub

# Add to .ssh/config for easy access
Host devbox
  HostName localhost
  Port 2222
  User root
  IdentityFile ~/.ssh/id_ed25519
  StrictHostKeyChecking no
  UserKnownHostsFile ~/.ssh/known_hosts