resource "aws_instance" "example" {
  ami           = "ami-12345678" # Dummy AMI for LocalStack
  instance_type = var.instance_type
  tags = {
    Name = "ec2-${var.env}"
    Env  = var.env
  }
}
