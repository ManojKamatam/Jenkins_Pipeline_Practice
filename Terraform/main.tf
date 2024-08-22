provider "aws" {
  region = "us-east-1"
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name        = "my-eb-application"
  description = "My Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_application_version" "my_app_version" {
  application = aws_elastic_beanstalk_application.my_app.name
  version_label = "v1.0.0"
  s3_bucket = var.s3_bucket
  s3_key = var.s3_key
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "Sample-beanstalk-env-env"  // Replace with your actual environment name
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "Python 3.11 running on 64bit Amazon Linux 2023/4.1.3"  // Ensure this matches your manual setup
  version_label       = aws_elastic_beanstalk_application_version.my_app_version.version_label
}

variable "s3_bucket" {
  type = string
  description = "The S3 bucket to store the application version"
}

variable "s3_key" {
  type = string
  description = "The S3 key for the application version"
}
