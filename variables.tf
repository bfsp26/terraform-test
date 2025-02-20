# cmd: export TF_VAR_virginia_cidr="10.10.0.0/16"
variable "virginia_cidr" {
  description = "Virginia CIDR"
  type        = string
  sensitive   = false
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type        = string
# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets" {
  description = "Subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "sg_egress_cidr" {
  description = "CIDR for egress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Instance parameters"
  type        = map(string)
}

variable "instance_name" {
  description = "Instance name"
  type        = set(string)
  default     = ["apache"]
}

variable "enable_monitoring" {
  description = "Enable monitoring"
  type        = bool
}

variable "ingress_port_list" {
  description = "Ingress port list"
  type        = list(number)
}
