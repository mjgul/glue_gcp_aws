resource "google_storage_bucket" "website_bucket" {
  name          = "${var.gcp_project_id}-website"
  location      = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
