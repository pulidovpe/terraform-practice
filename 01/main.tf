provider "aws" {
	region = "sa-east-1"
}

resource "aws_instance" "instacia_terraform" {
	ami = "ami-0923918e02cfeae93"
	instance_type = "t2.micro"
	tags = {
		Name = "practica1"
		Environment = "Develop"
	}
}