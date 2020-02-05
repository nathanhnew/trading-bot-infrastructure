variable "GCP_PROJECT" {
    type = string
}

variable "GCP_REGION" {
    default = "us-east4"
}

variable "GCP_ZONE" {
    default = "us-east1-b"
}

variable "development_region_public_cidr_range" {
    type = map
    default = {
        "us-east4" = "10.2.0.0/20"
        "us-west2" = "10.2.16.0/20"
        "us-central" = "10.2.32.0/20"
        "europe-west2" = "10.2.48.0/20"
        "asia-northeast1" = "10.2.64.0/20"
        "asia-east2" = "10.2.80.0/20"
    }
}

variable "development_region_private_cidr_range" {
  type = map
  default = {
      "us-east4" = "10.2.112.0/20"
      "us-west2" = "10.2.128.0/20"
      "us-central" = "10.2.144.0/20"
      "europe-west2" = "10.2.160.0/20"
      "asia-northeast1" = "10.2.176.0/20"
      "asia-east2" = "10.2.192.0/20"
  }
}

variable "application_region_public_cidr_range" {
    type = map
    default = {
        "us-east4" = "10.1.0.0/20"
        "us-west2" = "10.1.16.0/20"
        "us-central" = "10.1.32.0/20"
        "europe-west2" = "10.1.48.0/20"
        "asia-northeast1" = "10.1.64.0/20"
        "asia-east2" = "10.1.80.0/20"
    }
}

variable "application_region_private_cidr_range" {
  type = map
  default = {
      "us-east4" = "10.1.112.0/20"
      "us-west2" = "10.1.128.0/20"
      "us-central" = "10.1.144.0/20"
      "europe-west2" = "10.1.160.0/20"
      "asia-northeast1" = "10.1.176.0/20"
      "asia-east2" = "10.1.192.0/20"
  }
}
