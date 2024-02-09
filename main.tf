module "lambda_rolee" {
  source = "./modules/iam_role"
}


module "example_s3_bucket" {
  source = "./modules/s3_bucket"

  # You can specify any input variables required by your module here
  # For example, if your module expects a variable named "bucket_name", you can set it like this:
  bucket_name = "bapi-deb-input-datatiff"
  
}
module "example_s3_bucket2" {
  source      = "./modules/s3_bucket"
  bucket_name = "bapi-deb-output-textractt"
}


data "archive_file" "lambda_zip" {
  source_dir  = "${path.module}/lambdas3/"
  output_path = "${path.module}/lambdas3/s3processor1.zip"
  type        = "zip"
}


