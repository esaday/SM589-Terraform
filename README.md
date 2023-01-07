## ✨ SM589 - Terraform Project
---

### Introduction

> **Project : INFRASTRUCTURE AS CODE TOOL COMPARISON FOR MULTI-CLOUD DATA APPLICATIONS**

This repository contains the `terraform` step of the SM589 term project.

Please refer to the **Project Report** for the detailed explanation of the project.

#### 
---

### Prerequisites and Installation
You'll need the following tools to run the project:
- [tfenv](https://github.com/tfutils/tfenv)
- [terraform v.1.3.3](https://www.terraform.io/downloads.html)
- [awscli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [python3](https://www.python.org/downloads/)

Since the project is configured to use `AWS S3` as state backend, you'll need to require an `AWS account` and create an `S3 bucket` to store the state file.

Assuming that you have the above tools installed, you can run the following commands to configure install the required terraform plugins:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=<path to GCP creds json>
export AWS_PROFILE=<AWS profile to use> 
cd tf/
terraform init 
# will install the required plugins and initialize the state backend

```

---

### Running the Project
The project is structured with two modules named `main` and `data`. The `main` module contains the resources required to create the infrastructure for the main application on both cloud platforms.

The `data` module contains the logic to insert data to `DynamoDB Table` with sample data in which the loaded data will be replicated to the `BigQuery` table to demonstrate the data flow.

Assuming the project is configured as described in the previous section, you can run the following commands to create the infrastructure and take your own measurements:

1. You need to create a `variables` file to feed the required variables during the terraform run. You can use the `example.tfvars` file as a template. The only variable needed for this project is as follows:
```bash
gcp_creds_path = <path to GCP creds>
```
2. Creating the infrastructure and inserting data to the `DynamoDB` table can be done by running the following commands:
```bash
# create the infrastructure
terraform apply -target='module.main' -var-file=example.tfvars --auto-approve
# insert data to DynamoDB table
terraform apply -target='module.data' -var-file=example.tfvars --auto-approve
```
3. You can destroy the infrastructure by running the following command:
```bash
terraform destroy -var-file=example.tfvars --auto-approve
```
4. You can use `bash` `time` module to take the time measurements of the terraform run. You only need to prepend the command in evaluation with the `time` command. For example, you can run the following command to measure the time taken to create the infrastructure:
```bash
### Execution time for initial terraform apply
time terraform apply -target='module.main' -var-file=example.tfvars --auto-approve

```

> Please refer to the **Project Report** for the actual evaluation and measurements.
---

### 🤝 Code References

References to the code used in this project (both directly or by deriving) are listed below:

- [Code sample for pushing data to BigQuery tables](https://cloud.google.com/bigquery/docs/samples/bigquery-table-insert-rows-explicit-none-insert-ids#bigquery_table_insert_rows_explicit_none_insert_ids-python)

- [Setting up credentials for GCP](https://codelabs.developers.google.com/codelabs/cloud-bigquery-python#3)

- [DynamoDB Table Creation](https://github.com/nahidsaikat/blog-post-code) with the [blog post](
https://nahidsaikat.com/blog/process-aws-dynamodb-streams-by-aws-lambda-with-terraform/)

- [Sample Data for DynamoDB](
https://medium.com/@badawekoo/populate-dynamodb-table-items-with-single-terraform-resource-from-json-file-1dc14c830a7c)

- [Bigquery table and schema creation](
https://hevodata.com/learn/specifying-bigquery-schema/)
along with the [code from here](
https://github.com/sudovazid/gcp_terraform/blob/main/terraform.tfvars)
---

## Author

👤 **A. Esad AY**

---

## 📝 License

This project is [MIT](https://github.com/esaday/SM589-Terraform/blob/master/LICENSE) licensed.

---
