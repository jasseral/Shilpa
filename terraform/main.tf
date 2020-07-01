provider "aws" {
  profile = var.profile
  region  = var.region
}


resource "aws_instance" "master" {
  ami                         = var.image_id
  instance_type               = var.instance_type_master
  subnet_id                   = aws_subnet.subnet_for_cluster.id
  vpc_security_group_ids      = [aws_security_group.allow_port_22.id,aws_security_group.allow_port_80.id,aws_security_group.allow_port_8080.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_pair_key.key_name

     connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/aws")
    host        = self.public_ip
  }
  
}

#This copy the ip public of the EC2 create to anisble/hosts
resource "local_file" "hosts" {
    content = "[masters]\nmaster ansible_host=${aws_instance.master.public_ip} ansible_user=ubuntu\n[all:vars]\nansible_python_interpreter=/usr/bin/python3"
    filename = "../${path.module}/ansible/hosts"
}
