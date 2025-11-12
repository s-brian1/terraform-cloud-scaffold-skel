resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.location

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle {
    prevent_destroy = var.prevent_destroy
  }
}

output "bucket_name" {
  value = google_storage_bucket.this.name
}

output "bucket_location" {
  value = google_storage_bucket.this.location
}