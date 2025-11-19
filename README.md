# Terraform Automation Project

This project contains Terraform configuration to create an EC2 instance on AWS and install Nginx automatically using a shell script.

## Files
- ec2.tf – EC2 instance configuration
- providers.tf – AWS provider setup
- terraform.tf – Terraform settings
- install_nginx.sh – Nginx installation script

## How to Use
terraform init
terraform validate
terraform plan
terraform apply -auto-approve

## SSH Access
ssh -i terra-key-ec2 ubuntu@YOUR_PUBLIC_IP

## .gitignore (Important)
.terraform/
*.tfstate
*.tfstate.backup
