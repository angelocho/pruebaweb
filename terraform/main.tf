data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
}

resource "aws_instance" "pruebaweb" {
  ami                                  = "ami-04b1c88a6bbd48f8e"
  associate_public_ip_address          = true
  availability_zone                    = "eu-west-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.27.76"
  secondary_private_ips                = []
  source_dest_check                    = true
  subnet_id                            = "subnet-076e432dd91756679"
  tags = {
    "Name" = var.instance_name
  }
  key_name  = "clave-ust-angel"
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../ansible/aws_ec2.yml ../ansible/httpd_2048.yml"
  }
  tenancy = "default"
  vpc_security_group_ids = [
    "sg-039a1e791576f665b",
  ]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}