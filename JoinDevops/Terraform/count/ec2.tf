resource "aws_instance" "db" {
  # count = 3
  count = length(var.instance_name)  
  ami = var.image_id #arguments - values
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_type
  tags = var.instance_name[count.index]
}