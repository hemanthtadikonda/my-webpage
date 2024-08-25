locals {
  tags        = merge(var.tags,{ tf-module = "app" },{ env = var.env })
}