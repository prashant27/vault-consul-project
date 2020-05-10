# Set version
VAULT_VERSION="1.0.1"

# Download Vault binary
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

# Unzip binary
unzip vault_${VAULT_VERSION}_linux_amd64.zip

# Take root ownership
sudo chown root:root vault

# Move vault
sudo mv vault /usr/local/bin/

# Remove vault .zip binary 
rm -R vault_${VAULT_VERSION}_linux_amd64.zip

# Check vault
vault

# Check vault version
vault -v

################################## Prepare for systemd  #######################################

# Add username vault
sudo useradd --system --home /etc/vault.d --shell /bin/false vault

# Create directory for vault
sudo mkdir --parents /opt/vault

# Give ownership
sudo chown --recursive vault:vault /opt/vault

# Vault server systemd Unit file
sudo touch /etc/systemd/system/vault.service
sudo vi /etc/systemd/system/vault.service

# Create directory
sudo mkdir --parents /etc/vault

# Create vault server config
# vault_server.hcl is vault.hcl file
sudo touch /etc/vault/vault_server.hcl

# Give consul ownership
sudo chown --recursive vault:vault /etc/vault

# Change permission 
sudo chmod 640 /etc/vault/vault_server.hcl

# Set environment variable for vault server
export VAULT_ADDR='http://127.0.0.1:8200'


# Start vault and verify its state
sudo systemctl enable vault
sudo systemctl start vault
sudo systemctl status vault

# Open new terminal to set
# Set environment variable
export VAULT_ADDR='http://127.0.0.1:8200'

# Initialize vault server
# Get default 5 unseal key and 3 is threshold to unsealed 
vault operator init

# Get threshold status if it is unsealed or not
# Get vault server status
vault status

# Reach to threshold
vault operator unseal <unseal_key_3>

# Get vault server status
vault status

# Login to vault
vault login

# Write a secret to KV store
# output Success! Data written to: [storepath]/[keyname]
vault kv put [storepath]/[keyname] key = value

# Retrieve the secret
vault kv get [storepath/keyname]

