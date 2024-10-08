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
acm_certificate_arn = "arn:aws:acm:us-east-1:043254050286:certificate/1365c29b-dc35-46e7-9935-174855a323a8"

default_vpc_id = "vpc-05642ce42b99a7fae"
default_vpc_cidr_block = "172.31.0.0/16"
def_route_table_id = "rtb-0dbc8b1b5e435955e"
az = ["us-east-1a","us-east-1b"]

zone_id = "Z08613511MUJYQJT5FVBT"
ssh_ingress_cidr = ["172.31.34.184/32"]

alb = {
  public = {
    internal = false
    lb_type = "application"
    sg_port = 443
    sg_ingress_cidr = [ "0.0.0.0/0" ]

  }
  private = {
    internal  = true
    lb_type = "application"
    sg_port  = 80
    sg_ingress_cidr = [ "172.31.0.0/16" , "10.0.0.0/24" ]

  }
}

app = {
  my-app = {
    app_listen_port = 8501
    instance_type = "t3.micro"
    desired_capacity = 1
    max_size = 1
    min_size = 1
    lb_priority =1
  }



}









