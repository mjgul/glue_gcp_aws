output "website_url" {
  value = google_storage_bucket.website_bucket.url
}

output "function_url" {
  value = google_cloudfunctions_function.function.https_trigger_url
}
