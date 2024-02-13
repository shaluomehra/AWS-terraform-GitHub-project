# Who is the provider
provider "aws" {


# location of aws
   region = "eu-west-1"

}
# to download required dependencies
# create a service/resource on the cloud - ec2 on AWS

resource "aws_instance" "shaluo-tech254-iac" {
    ami = "ami-0905a3c97561e0b69"
    instance_type = "t2.micro"
    tags = {
     Name = "shaluo-tech254-iac"
    }
}