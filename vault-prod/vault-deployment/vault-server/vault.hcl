
# Vault server configuration

# It supported tcp 
# Allow all communication (External and internal)
   listener "tcp" {
    address          = "0.0.0.0:8200"
    cluster_address  = "0.0.0.0:8201"
    tls_disable      = "true"
  }


# It represent what type of storage is being used
# How to connect to storage type
# consul agent running, that advertise on port 8500
  storage "consul" {
    address = "127.0.0.1:8500"
    path    = "vault/"
  }

# vault server IP
  api_addr =  "https://192.168.1.9:8200"
  cluster_addr = "https://192.168.1.9:8201"
# content is written never out to disk
  disable_mlock = true


# Vault server initially is in sealed state
# Use to shared encryption key to assmeble master key
# sealed type may be different type like Azure key Vault or AWS's KMS
# seal "type_name" {}

# For ui
# ui = [true | false]