# Terraform Project

## Downloading and Installing Terraform

- Step 1: Download Terraform from the website and unzip to get the terraform.exe file, move this to the Windows PATH C:/Windows/System32 

- Step 2: Open a GitBash Terminal and type terraform then terraform --version


## Launching an EC2 Instance with Terraform

**NOTE**: Make sure your AWS KEY AND SECRET KEY are set up as environment variables

Create a `main.tf` file with the following code

```python
# Who is the provider
provider "aws" {


# location of aws
   region = "eu-west-1"

}
# to download required dependencies
# create a service/resource on the cloud - ec2 on AWS

resource "aws_instance" "shaluo-tech254-iac" {
    ami = "ami-0905a3c97561e0b69"
    instance_type = "t2.micro"
    tags = {
     Name = "shaluo-tech254-iac"
    }
}
```

## Creating a Github Repository using Github Token and Terraform

Get your Github Token from www.github.com > Settings > Developer Settings > Personal Access Tokens > Fine-grained Tokens

Create a token, in this case we'll call it 'terraform' and set the access to All Repositories

![Screenshot 2024-02-13 104616.png](images%2FScreenshot%202024-02-13%20104616.png)

Then Repository Permissions > Admin > Read + Write

![Screenshot 2024-02-13 104952.png](images%2FScreenshot%202024-02-13%20104952.png)

And then Generate the Token, use that token path in the below code to create a repo
```
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "<your-github-token>"
}

resource "github_repository" "test" {
  name        = "test"
  description = "test"

  visibility = "public"
}
```


`terraform init` to initialise <br>
`terraform plan` to start up the code in the .tf files <br>
`terraform apply` to execute <br>

You should see something similar in the console output: 

![Screenshot 2024-02-13 105432.png](images%2FScreenshot%202024-02-13%20105432.png)

Now we can go to github and check if the repo has been created

![Screenshot 2024-02-13 105646.png](images%2FScreenshot%202024-02-13%20105646.png)






