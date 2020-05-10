# update software
apt update

# Install unzip if not installed
sudo apt install unzip -y

# download vault package
VAULT_VERSION="1.0.1"
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip

# Unzip vault
unzip vault_${VAULT_VERSION}_linux_amd64.zip
ls
rm -R vault_${VAULT_VERSION}_linux_amd64.zip

# take root ownership
sudo chown root:root vault
sudo mv vault /usr/local/bin/

# check if vault is install or not
# you will get helpful command
vault

# check vault version although you alreadu know
vault -v


######################## Dev Server ##################

# start the dev server
# it will give root token and environment detail
# will give you unseal key, that we can use to seal vault
# set both ADDR and Token 
vault server -dev

# open new terminal to set
# Set environment variable
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN=ADDTOKEN

# login to vault
# use root token that you set in VAULT_TOKEN
# 3 way to interact with vault serve
# 1. vault executable
# 2. API
# 3. UI
# if you get sucessful authenticate message, means you are ready to command against vault
vault login


# Basic Secret

# Write a secret to KV store
vault kv put [storepath]/[keyname] key = value

# Retrieve the secret
vault kv get [storepath/keyname]

# update the secret
vault kv put [storepath]/[keyname] key = value

# Delete the secret
vault kv delete [storepath/keyname]


# for audit
sudo cat /var/log/syslog


