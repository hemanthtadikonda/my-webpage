vpc = {
  main ={
    cidr = "10.0.0.0/24"
    subnets = {
      public = {
        public1 = { cidr =  "10.0.0.0/27" , az = "us-east-1a" }
        public2 = { cidr = "10.0.0.32/27" , az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.0.64/27" , az = "us-east-1a" }
        app2 = { cidr = "10.0.0.96/27" , az = "us-east-1b" }

      }

    }
  }
}