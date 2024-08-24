locals {

  public_subnets_id = [for k, v in lookup(lookup(module.subnets,"public",null),"subnets_ids",null) : v .id]


  tags = merge(var.tags , { tf-module = "${var.env}-vpc"},{ env = var.env})
}