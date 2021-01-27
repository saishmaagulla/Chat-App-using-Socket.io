terraform {
  required_providers {
    aws = {
	source     = "hashicorp/aws"	
	version    = "~> 3.0"
}
}
}

provider "aws" {
	region 	   = var.region
	skip_metadata_api_check = true
	skip_get_ec2_platforms = true
	skip_credentials_validation = true
}
