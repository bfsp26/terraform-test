resource "aws_instance" "public_instance" {
  for_each               = var.instance_name
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/test.sh")

  provisioner "local-exec" {
    command = "echo 'Instance created with IP: ${self.public_ip}' >> instance_data.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Instance destroyed with IP: ${self.public_ip}' >> instance_data.txt"
  }

  provisioner "remote-exec" {
    inline = ["echo 'Hello world!' > ~/hello.txt"]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("custom_key.pem")
    }
  }

  tags = {
    "Name" = each.value
  }

  # lifecycle {
  #   replace_triggered_by = [ aws_subnet.private_subnet.id ]
  # }
}

resource "aws_instance" "monitoring_instance" {
  count                  = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
}
