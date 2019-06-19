## CloudWatch Logs

resource "aws_cloudwatch_log_group" "ecs" {
  name = "aniket-ecs-group/ecs-agent"
}

resource "aws_cloudwatch_log_group" "movieapp" {
  name = "aniket-ecs-group/movieapp"
}

resource "aws_cloudwatch_log_group" "bookingapp" {
  name = "aniket-ecs-group/bookingapp"
}

resource "aws_cloudwatch_log_group" "showtimeapp" {
  name = "aniket-ecs-group/showtimeapp"
}

