cat <<EOF>ec2.tf
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"
  count                 = $2
  ami                    = "$3"
  instance_type          = "t2.micro"
  key_name               = "terra"
  monitoring             = true
  vpc_security_group_ids = ["sg-00fe4fd87f8b5ee85"]
  subnet_id              = "subnet-0b00eae735143e1a2"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

EOF

terraform $1
