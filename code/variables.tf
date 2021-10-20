#The default values for the variables will be used unless you specify something different in:
# 1) the cli (e.g. terraform plan -var="port=80")
# 2) the terraform.tfvars file
# 3) a custom .tfvars file (e.g. terraform plan -var-file="customFile.tfvars")
# 4) using environment variables (e.g. export TF_VAR_port="80")

variable "port" {
  #If someone tries to specify a string, this will fail as I have set the type to number!
  type=number
  default = "22"
}

variable "keyname" {
  default = "PaloAWSKey"
}