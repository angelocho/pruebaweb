variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "pruebaweb"
}
variable "ami" {
 description = "value of the ami"
 type = string
 default = "ami-04b1c88a6bbd48f8e"
}
variable "instance-type" {
  description = "value of the instace type"
  type = string
  default = "t2.micro"
}
variable "private-ip" {
  description = "value of the private ip"
  type = string
  default = "172.31.27.76"
}
variable "subnet-id" {
  description = "value of the subnet"
  type = string
  default = "subnet-076e432dd91756679"
}
