# Using terraform for project administrators

## Setting up the terraform project

### GitHub API Token

You will need a GitHub API token in your environment that has at least admin:org permissions for the ros2-gbp organization.
This token should be in an exported environment variable `GITHUB_TOKEN`.
It is recommended that you use short lived tokens which are exported only for the shell which you are using to run terraform. 
egenerated each time that you need them rather than keeping an exported token in your environ

### AWS credentials

Terraform state is stored in a shared dynamodb instance.
Open Robotics staff with AWS console access can create credentials and set up their local workstation using the `aws configure` command from the AWS cli.

### Terraform

Terraform is available from <https://terraform.io>.
If you are running on Arch Linux terraform is packaged in the Arch repositories and stays up to date.
If you're running on Ubuntu, Debian, or Fedora you can add the Hashicorp repository to [download terraform](https://www.terraform.io/downloads).

Once changes to this repository are merged, terraform changes must be planned and applied before taking effect.
This terraform project is not currently set up to run automatically in order to require a human in the loop for safety.
It would be very bad if a misfired terraform run deleted all release repositories.

## Initializing a local terraform workspace

Run `terraform init` in the local repository to initialize local terraform state and fetch any required providers.
If you're developing the terraform project and need to upgrade any providers be sure to run `terraform init -upgrade` to allow the upgraded providers to be installed. By default terraform locks provider versions to prevent unintended drift.

## Reviewing terraform changes

In a configured workspace run `terraform plan -out plan.out > plan.txt`.
The output, piped to `plan.txt` can be viewed with `less -R plan.txt`
This will display a list of changes terraform will make for you to review. 
The `plan.out` file is used to automatically apply the plan exactly as it was previously reviewed, the plan will fail to apply if it becomes stale because state changed between plan and application thus preventing unintended changes between reviewing and applying a plan.

Terraform organizes managed objects into resources which can be added, changed, and destroyed.
This project uses the GitHub provider to manage a GitHub organization with terraform.

In most situations for this project you should only see changed and added resources.

`github_repository` resources _must not_ be destroyed or the corresponding repository will be deleted on GitHub.
`github_membership` resources will be created for each individual member of the ros2-gbp organization or destroyed when a member is removed from all teams in the organization.

`github_team_membership` and `github_team_repository` resources are created within the `release_team` module.
These will be created or destroyed whenever members or repositories are added or removed from a release team.

## Workflow for processing PRs

Terraform plan is taking longer and longer so reviewing and merging PRs in batches is recommended.
Here is a workflow that I (nuclearsandwich) have settled as of 2025

### Setup

* Fire up a fresh browser window open on <https://github.com/ros2-gbp/ros2-gbp-github-org/issues>
* In a terminal, pull up [ros2/ros2-gbp-github-org](https://github.com/ros2-gbp/ros2-gbp-github-org/)
* In a second terminal or tab, open up [ros/rosdistro](https://github.com/ros/rosdistro) which can help quickly grep for packages in the rosdistro index.

### Reviewing issues

* Create a fresh tab for an issue, check the necessary review elements per the [review guidelines](./REVIEW_GUIDELINES.md).
* If the issue isn't ready to process, apply one of the labels to note what is missing, close it and move on.
* If it is, create a branch with `git checkout -b i/$ISSUE_NUMBER`.
* Make the necessary edits to complete the request.
* Commit the change `git commit -m 'Update release repository or team membership.'`
* Push the branch up to ros2-gbp `git push origin i/$ISSUE_NUMBER`
* Create a pull request `gh pr create --body "Resolves i/$ISSUE_NUMBER."`
* Poll using `gh pr checks` and wait for the checks to pass.
* Merge the pull request with `gh pr merge --squash`, it will close the issue automatically.
* Return to the `latest` branch and update. `git checkout latest && git pull origin latest`
* Keep the issue tab open so you can notify once changes are deployed.
* Take up another issue and repeat until complete.

### Deploy changes

After you've gone through all open issues and pull requests, follow the instructions above in the [Terraform](#Terraform) section to plan and apply new changes.
This can take a while so getting a beverage, a snack, or taking a walk is warranted.

Once the deployment has completed successfully, add a message like "This change has been deployed." on each of the relevant issues so that the requestors know it has been fulfilled.
