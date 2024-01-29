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
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "my storage bucket name"
  default     = "absolute-axis-409317-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"

}

