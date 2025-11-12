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

resource "google_storage_bucket_acl" "this" {
  bucket = google_storage_bucket.this.name

  role_entity {
    role   = "OWNER"
    entity = "user-${var.owner_email}"
  }

  role_entity {
    role   = "READER"
    entity = "allUsers"
  }
}