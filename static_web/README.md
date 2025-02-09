# Static Web deployment on s3

Host: http://web-bucket.s3-website.localhost.localstack.cloud:4566/

## How to run

* Start localstack locally using Docker

```bash
terraform init
terraform apply
```

## Useful Terraform commands

* Initialize state

```bash
terraform init
```

* See terraform changes

```bash
terraform plan
```

* Apply changes

```bash
terraform apply
```

* Destroy infrastructure

```bash
terraform destroy
```
