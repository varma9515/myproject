# Terraform Configure setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/azure"
      
    }
  }
}

# Provider Block
provider "azure" {
  profile = "default" 
  region  = "ap-south-1"
}

#Resource Block
resource "azure_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "serverazureB2s"

}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/azure"
  

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a"]
  private_subnets     = ["10.0.1.0/24"]
  public_subnets      = ["10.0.101.0/24"]

#new comment added 
