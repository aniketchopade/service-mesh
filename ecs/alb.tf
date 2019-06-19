## ALB
resource "aws_alb_target_group" "movie_target_group" {
  name     = "movie-ecs-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_alb_target_group" "booking_target_group" {
  name     = "booking-ecs-tg"
  port     = 3001
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_alb_target_group" "showtime_target_group" {
  name     = "showtime-ecs-tg"
  port     = 3002
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_alb" "main" {
  name = "aniket-alb-ecs"

  #internal        = "true"
  subnets         = [var.dc_subnet_1, var.dc_subnet_2]
  security_groups = [var.dc_security_group, var.infosec_security_group]
}

resource "aws_alb_listener" "front_end_movie" {
  load_balancer_arn = aws_alb.main.id
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.movie_target_group.id
    type             = "forward"
  }
}

resource "aws_alb_listener" "front_end_booking" {
  load_balancer_arn = aws_alb.main.id
  port              = "3001"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.booking_target_group.id
    type             = "forward"
  }
}

resource "aws_alb_listener" "front_end_showtime" {
  load_balancer_arn = aws_alb.main.id
  port              = "3002"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.showtime_target_group.id
    type             = "forward"
  }
}

