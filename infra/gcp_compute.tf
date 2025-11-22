resource "google_storage_bucket" "function_bucket" {
  name     = "${var.gcp_project_id}-function-source"
  location = var.gcp_region
}

resource "google_storage_bucket_object" "archive" {
  name   = "source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "../app/api/source.zip" # Placeholder, needs actual zip
}

resource "google_cloudfunctions_function" "function" {
  name        = "visitor-counter"
  description = "Visitor Counter Function"
  runtime     = "python39"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "main"
  
  environment_variables = {
    GCP_PROJECT_ID = var.gcp_project_id
  }
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
