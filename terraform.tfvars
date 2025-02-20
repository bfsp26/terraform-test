# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"
virginia_cidr = "10.10.0.0/16"
subnets       = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "Dev"
  "name"        = "Test"
  "owner"       = "BFSP"
  "cloud"       = "AWS"
  "IaC"         = "Terraform"
  "IaC_version" = "1.10.5"
}
sg_ingress_cidr = "0.0.0.0/0"
sg_egress_cidr  = "0.0.0.0/0"
ec2_specs = {
  "ami"           = "ami-0c614dee691cbbf37"
  "instance_type" = "t2.micro"
}
enable_monitoring = false
ingress_port_list = [22, 80, 443]
