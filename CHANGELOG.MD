#### 2021, Fri, Mar 5 

1. Install Nix tool to obtain Terraform and other dependencies
    * Add in `setup_nix_local.sh` script.

2. Obtain credentials for AWS User
    * Login to root account via AWS Portal
    * Revoke previous credentials
    * Create new credentials and download as CSV
    * export credentials so they are available in the shell environment

3. Set up the Terraform remote state
    * commented out the terraform backend field in `main.tf`
    * updated the bucket name and region the `main.tf`
    * ran `terraform init` from local machine
    * ran `terraform apply` from local machine and made sure to review the changes before typing `yes`, as there was other `.tf` files in the directory which we didn't want to risk being charged for yet.
    * `aws s3 ls` should return the created bucket
    * uncommented the backend field in `main.tf` and ran `terraform init` again, read the warning before typing `yes`
    * Added aws credentials to the Github repository secrets

4. Add Github Actions Workflow to automate deployment
    * Based on the action found [here](https://github.com/loujaybee/terraform-aws-github-action-bootstrap/blob/master/.github/workflows/master.yml)
    * renamed the branch to match this `dev` repo.