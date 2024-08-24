vpc = {
  main ={
    cidr = "10.0.0.0/24"
    subnets = {
      public = {
        public1 = { cidr = "10.0.0.0/27" , az = "us-east-1a" }
        public2 = { cidr = "10.0.0.32/27" , az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.0.64/27" , az = "us-east-1a" }
        app2 = { cidr = "10.0.0.96/27" , az = "us-east-1b" }

      }

    }
  }
}

tags = {
  organization  = "TCL TECH"
  project_name  = "my-app"
  business_unit = "DFS"
  tower         = "AOD-AOM"
}

env = "dev"

default_vpc_id = "vpc-05642ce42b99a7fae"
default_vpc_cidr_block = "172.31.0.0/16"
def_route_table_id = "rtb-0dbc8b1b5e435955e"