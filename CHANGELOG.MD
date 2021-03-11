#### 2021, Thu, Mar 11 

1. Continuing Terraform of Budget
    * `Terraform import` appears to have additional configuration when using a remote backend, so instead stuck to cross referencing manually created budget with local tf file.
    * Deleted manually created budget and pushing local tf file.


#### 2021, Sat, Mar 6 

1. Adding a budget to track free tier usage
    * Documentated [here](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tracking-free-tier-usage.html) it's possible to track free tier usage using AWS Billing. Granting access to an IAM user via adding a policy is not enough, the root account is in charge of billing and so it's via the root account that billing access for IAM  users must be activated, read more [here](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/control-access-billing.html#ControllingAccessWebsite-Activate). Following those steps, then checking in the dev user portal appears to activate the billing home page but not the budgets page. Appears that `AWSBudgetsActionsWithAWSResourceControlAccess` is also required for budget's access.
    * The free tier usage tracking with AWS Budgets can be found [here](https://aws.amazon.com/getting-started/hands-on/control-your-costs-free-tier-budgets/), and a budget can be manually set up this way.
    * Replicate the budget in Terraform, using the [budget](https://console.aws.amazon.com/billing/home#/budgets/details?name=Monthly%20Cost%20Budget) and the [docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget#argument-reference)


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
    * Received STS signature does not match error, attempted to update secrets based on what was exported locally. Tried using Github environment secrets instead but failed with missing secret error probably due to dot notation being missing. Tried to update to AWS Provider version 3.
    * Received `You must complete the Terraform 0.13 upgrade process before upgrading to later versions.`, amended based on Hashi's [docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).
    * Problem could be because state was initialized locally using Terraform v0.12.30 but the Github Action is using a newer version Terraform v0.14.7.
    * Added new TF version to setup that is actually available on [Nix](https://search.nixos.org/packages?channel=unstable&show=terraform_0_14&from=0&size=30&sort=relevance&query=terraform)
    * Ran step to update state, failed to fully upgrade to TF V0.14.7.
    * Deleted bucket on AWS
    * Deleted local `.terraform` folder and the tcl lock file. Then followed step 3 again to restart. Commented out the regional sts endpoint because of [this](https://github.com/hashicorp/terraform-provider-aws/issues/14873) issue thrown when running `terraform apply`.
    * Uncommented the remote backend again and run `terraform init`.
    * Committed TCL lockfile because it's like packagelock.json [see here](https://www.terraform.io/docs/language/dependency-lock.html).