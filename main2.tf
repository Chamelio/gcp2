terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "flemingfridays2-0"
  region = "southamerica-west1"
  zone = "southamerica-west1-b"
  credentials = "flemingfridays2-0-868c2f508adc.json"
}

resource "google_storage_bucket" "latina_flavor" {
  name          = "caliente_spice"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  
}

resource "google_compute_network" "caliente_spice-auto-vpc-tf" {
  name = "calientespice2-auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "caliente_spice-sub-sg" {
  name ="sub-sg"
  network = google_compute_network.caliente_spice-auto-vpc-tf.id
  ip_cidr_range = "10.125.1.0/24"
  region = "northamerica-northeast1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.caliente_spice-auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}