resource "google_secret_manager_secret" "aws_access_key" {
  secret_id = "aws-access-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "aws_access_key_val" {
  secret = google_secret_manager_secret.aws_access_key.id
  secret_data = aws_iam_access_key.function_key.id
}

resource "google_secret_manager_secret" "aws_secret_key" {
  secret_id = "aws-secret-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "aws_secret_key_val" {
  secret = google_secret_manager_secret.aws_secret_key.id
  secret_data = aws_iam_access_key.function_key.secret
}
