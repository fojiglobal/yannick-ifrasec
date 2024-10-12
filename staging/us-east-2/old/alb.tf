############ Target Group #############
resource "aws_lb_target_group" "staging_tg" {
  name     = "${var.staging_evn}-tg-80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.staging.id
  health_check {
    healthy_threshold = 2
    interval = 10
  }
}

########### Aplication Loadbalancer #########
resource "aws_lb" "staging_alb" {
  name               = "${var.staging_evn}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pub-sg.id]
  subnets            = [aws_subnet.staging_pub_1.id, aws_subnet.staging_pub_2.id]
  drop_invalid_header_fields = var.drop_invalid_header
   
  tags = {
    Name = "${var.staging_evn}-alb"
    Environment = var.staging_evn
  }
}

########### Listener for our ALB ##########
resource "aws_lb_listener" "staging_https" {
  load_balancer_arn = aws_lb.staging_alb.arn
  port              = var.alb_port_https
  protocol          = var.alb_protocol_https
  ssl_policy        = var.alb_ssl_profile
  certificate_arn   = data.aws_acm_certificate.alb_cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging_tg.arn
  }
}

######## Redirect 80 Trafice To 443 ################
resource "aws_lb_listener" "staging_http_https" {
  load_balancer_arn = aws_lb.staging_alb.arn
  port              = var.alb_port_http
  protocol          = var.alb_protocol_http

  default_action {
    type = "redirect"

    redirect {
      port        = var.alb_port_https
      protocol    = var.alb_protocol_https
      status_code = "HTTP_301"
    }
  }
}

######### Listener Rule ##########
resource "aws_lb_listener_rule" "stagin_web_rule" {
  listener_arn = aws_lb_listener.staging_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging_tg.arn
  }

  condition {
    host_header {
      values = ["stage.bgreencitylabs.com", "www.stage.bgreencitylabs.com"]
    }
  }
}