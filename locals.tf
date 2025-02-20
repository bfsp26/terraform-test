locals {
  sufix = "(ecuio${var.tags.env})"
}

resource "random_string" "s3_suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-suffix = "${var.tags.env}-${random_string.s3_suffix.id}"
}
