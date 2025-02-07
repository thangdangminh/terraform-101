terraform {
  backend "s3" {
    bucket                      = "terraform-state"
    key                         = "multi-environments/prod/terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://localhost:4566"
    access_key                  = "test"
    secret_key                  = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}


module "ec2" {
  source        = "../../modules/ec2"
  env           = var.env
  instance_type = var.instance_type
}
