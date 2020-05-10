# Require vault and consul machine
# For vault, port 8301 (gossip protocal), 8300 (RPC protocol)
# Frontend vault use port 8200
# vault use port 8500 to interact with consul
# For vault cluster, use port 8201 to cluser together
# One vault would be active rest woule be standby
# Make sure ports should be available i.e 8301, 8300, 8200, 8500, and 8201



# Create 2 or more consul server into a cluster
# Consul use port 8300 to replicate data to each other


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

# Move into bin
sudo mv consul /usr/local/bin/

# Remove consul binary 
rm -R consul_${CONSUL_VERSION}_linux_amd64.zip

# Check consul
consul

# Check consul version
consul -v

################################## To run consul as a service ##########################
################################## Prepare systemd            ###########################################

# Add username consul
sudo useradd --system --home /etc/consul.d --shell /bin/false consul

# Create directory for consul
sudo mkdir --parents /opt/consul

# Give ownership 
sudo chown --recursive consul:consul /opt/consul


# Create consul service file
sudo touch /etc/systemd/system/consul.service

# Create general config
# Generate encryption key
consul keygen

# Consul server IP
ip addr

# Create directory
sudo mkdir --parents /etc/consul.d

#
sudo touch /etc/consul.d/consul.hcl
sudo vi /etc/consul.d/consul.hcl

# Give consul ownership
sudo chown --recursive consul:consul /etc/consul.d

# Change permission 
sudo chmod 640 /etc/consul.d/consul.hcl

# Create consul server config
# Details of instance (Server) and server expectation in cluster with ui 
sudo touch /etc/consul.d/server.hcl
sudo vi /etc/consul.d/server.hcl

# Give consul ownership
sudo chown --recursive consul:consul /etc/consul.d

# Change permission
sudo chmod 640 /etc/consul.d/server.hcl

# Enable and start consul service
sudo systemctl enable consul
sudo systemctl start consul

# Get consul cluster list with status
consul members

