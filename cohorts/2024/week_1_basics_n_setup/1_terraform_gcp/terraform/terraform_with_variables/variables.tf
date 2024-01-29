
variable "credentials" {
  description = "my gcp credentials"
  default     = "./keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "absolute-axis-409317"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}


variable "bq_dataset_name" {
  description = "my bigquery dataset name"
  default     = "zoomcamp_dataset"
}

variable "gcs_bucket_name" {
  description = "my storage bucket name"
  default     = "absolute-axis-409317-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"

}



# variable "credentials" {
#   description = "My Credentials"
#   default     = "<Path to your Service Account json file>"
#   #ex: if you have a directory where this file is called keys with your service account json file
#   #saved there as my-creds.json you could use default = "./keys/my-creds.json"
# }


# variable "project" {
#   description = "Project"
#   default     = "<Your Project ID>"
# }

# variable "region" {
#   description = "Region"
#   #Update the below to your desired region
#   default     = "us-central1"
# }

# variable "location" {
#   description = "Project Location"
#   #Update the below to your desired location
#   default     = "US"
# }

# variable "bq_dataset_name" {
#   description = "My BigQuery Dataset Name"
#   #Update the below to what you want your dataset to be called
#   default     = "demo_dataset"
# }

# variable "gcs_bucket_name" {
#   description = "My Storage Bucket Name"
#   #Update the below to a unique bucket name
#   default     = "terraform-demo-terra-bucket"
# }

# variable "gcs_storage_class" {
#   description = "Bucket Storage Class"
#   default     = "STANDARD"
# }