terraform {
  backend "gcs" {
    bucket  = "YOUR_TF_STATE_BUCKET_NAME"
    prefix  = "terraform/state"
  }
}
