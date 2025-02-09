# Multi Environments

## How to run

* Create `prod.tfvars` file within `production/` folder by refering to `.prod.tfvars.example` file

* Create `stg.tfvars` file within `staging/` folder by refering to `.stg.tfvars.example` file

* Start localstack locally using Docker

* For production run
```bash
cd environments/production
terraform init
terraform apply --var-file=prod.tfvars 
```
The same for staging env

## Useful Terraform commands

* Initialize state

```bash
terraform init
```

* See terraform changes

```bash
terraform plan --var-file=prod.tfvars
```

* Apply changes

```bash
terraform apply --var-file=prod.tfvars
```

* Destroy infrastructure

```bash
terraform destroy --var-file=prod.tfvars
```
