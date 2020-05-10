# Use Vault server


#################################################################################
############################### Install  agent on vault server ##################
#################################################################################



# Upadte packages and install  unzip 
sudo apt update -y
sudo apt install unzip -y

# Download consul binary
CONSUL_VERSION="1.4.1"
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

# Unzip binary
unzip consul_${CONSUL_VERSION}_linux_amd64.zip

# Take root ownership
sudo chown root:root consul

# Move consul
sudo mv consul /usr/local/bin/

# Remove consul .zip binary 
rm -R consul_${CONSUL_VERSION}_linux_amd64.zip

# Check consul
consul

# Check consul version
consul -v

################## Prepare for systemd ###########################################

# Add username consul
sudo useradd --system --home /etc/consul.d --shell /bin/false consul

# Create directory for consul
sudo mkdir --parents /opt/consul

# Give ownership 
sudo chown --recursive consul:consul /opt/consul

# Create consul service file
sudo touch /etc/systemd/system/consul.service
sudo vi /etc/systemd/system/consul.service

# Create general config

# Consul server IP
ip addr

# Create directory
sudo mkdir --parents /etc/consul.d

# Contain consul encryption key with consul cluster details
# that is consul-agent.hcl file in this project
sudo touch /etc/consul.d/consul.hcl

# Give consul ownership
sudo chown --recursive consul:consul /etc/consul.d

# Change permission 
sudo chmod 640 /etc/consul.d/consul.hcl

# Enable and Start service
sudo systemctl enable consul
sudo systemctl start consul

#Check consul status
consul members
