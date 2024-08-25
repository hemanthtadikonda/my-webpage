resource "aws_security_group" "main" {
  name        = "${var.env}-myapp-ins-sg"
  description = "${var.env}-myapp-ins-sg"
  vpc_id      = var.vpc_id
  tags        = merge(var.tags , { Name = "${var.env}-myapp-ins-sg"})

  ingress {
    description      = "SSH"
    from_port        =  22
    to_port          =  22
    protocol         = "tcp"
    cidr_blocks      = var.ssh_ingress_cidr
  }
  ingress {
    description      = "APP"
    from_port        =  var.app_listen_port
    to_port          =  var.app_listen_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_ingress_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_launch_template" "main" {
  name                   = "${var.env}-myapp-template"
  image_id               = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main.id ]

  tag_specifications {
    resource_type = "instance"
    tags          = merge(local.tags,{ Name = "${var.env}-myapp-template" })
  }

  user_data = base64encode("${path.module}/userdata.sh")
}

resource "aws_autoscaling_group" "main" {
  name_prefix         = "${var.env}-myapp-asg"
  vpc_zone_identifier = var.app_subnet_ids
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns   = [ aws_lb_target_group.main.arn ]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "${var.env}-myapp-asg"
    propagate_at_launch = true
  }
  tag {
    key                 = "Monitor"
    value               = "yes"
    propagate_at_launch = true
  }
}

resource "aws_lb_target_group" "main" {
  name     = "${var.env}-myapp-asg"
  port     = var.app_listen_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    path                = "/health"
    port                = var.app_listen_port
    timeout             = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}
resource "aws_lb_target_group" "public" {
  name        = "${var.env}-myapp-pub"
  port        = var.app_listen_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.default_vpc_id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 5
    path                = "/"
    port                = var.app_listen_port
    timeout             = 2
    unhealthy_threshold = 2
    matcher             = "404"
  }
}

resource "aws_lb_target_group_attachment" "public" {
  target_group_arn = aws_lb_target_group.public.arn
  target_id        = [ tolist(data.dns_a_record_set.private_lb_add.addrs)]
  port             = 80
  availability_zone = "all"
}

resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = "${var.env}-hemanth"
  type    = "CNAME"
  ttl     = 30
  records = [var.public_alb_name]
}

resource "aws_lb_listener_rule" "main" {
  listener_arn = var.private_alb_listener
  priority     = var.lb_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }

  condition {
    host_header {
      values = ["${var.env}-hemanth.tadikonda.site"]
    }
  }
}

resource "aws_lb_listener_rule" "public" {
  listener_arn = var.public_alb_listener
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public.arn
  }

  condition {
    host_header {
      values = ["${var.env}-hemanth.tadikonda.site"]
    }
  }
}