# Using terraform for project administrators

## Setting up the terraform project

### GitHub API Token

You will need a GitHub API token in your environment that has at least admin:org permissions for the ros2-gbp organization.
This token should be in an exported environment variable `GITHUB_TOKEN`.
It is recommended that you use short lived tokens which are exported only for the shell which you are using to run terraform. 
egenerated each time that you need them rather than keeping an exported token in your environ

### AWS credentials

Terraform state is state in a shared dynamodb instance.
Open Robotics staff with AWS console access can create credentials and set up their local workstation using the `aws configure` command from the AWS cli.

### Terraform

Terraform is available from <https://terraform.io>.
If you are running on Arch Linux terraform is packaged in the Arch repositories and stays up to date.
If you're running on Ubuntu or Debian TODO when the Terraform website isn't down.

Once changes to this repository are merged, terraform changes must be planned and applied before taking effect.
This terraform project is not currently set up to run automatically in order to require a human in the loop for safety.
It would be very bad if a misfired terraform run deleted all release repositories.

## Initializing a local terraform workspace

Run `terraform init` in the local repository to initialize local terraform state and fetch any required providers.
If you're developing the terraform project and need to upgrade any providers be sure to run `terraform init -upgrade` to allow the upgraded providers to be installed. By default terraform locks provider versions to prevent unintended drift.

## Reviewing terraform changes

In a configured workspace run `terraform plan -out plan.out`.
This will display a list of changes terraform will make for you to review and save the plan to be applied in the future.

Terraform organizes managed objects into resources which can be added, changed, and destroyed.
This project uses the GitHub provider to manage a GitHub organization with terraform.

In most situations for this project you should only see changed and added resources.

`github_repository` resources _must not_ be destroyed or the corresponding repository will be deleted on GitHub.
`github_membership` resources will be created for each individual member of the ros2-gbp organization.

`github_team_membership` and `github_team_repository` resources are created within the `release_team` module.
These will be created or destroyed whenever repositories are added or removed from a release team.
