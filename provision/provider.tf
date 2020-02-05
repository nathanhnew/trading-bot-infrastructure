provider "google" {
    credentials = file("~/Projects/trading-bot/keys/cloud-trading-bot.json")
    project = var.GCP_PROJECT
    region = var.GCP_REGION
    zone = var.GCP_ZONE
}