output "droplet_ip_addresses" {
   description = "Ips publicas"
   value = aws_instance.pruebaweb.public_ip
}