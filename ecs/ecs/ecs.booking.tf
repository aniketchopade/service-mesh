## ECS

resource "aws_ecs_cluster" "main" {
  name = "aniket-ecs-cluster"
}

data "template_file" "task_definition_booking" {
  template = "${file("${path.module}/task-definition.booking.json")}"

  vars = {
    image_url        = "${var.booking_image_url}"
    container_name   = "booking"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.bookingapp.name}"
  }
}

resource "aws_ecs_task_definition" "booking_task" {
  family                = "booking-task"
  container_definitions = "${data.template_file.task_definition_booking.rendered}"
}

resource "aws_ecs_service" "booking_service" {
  name            = "booking-service"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.booking_task.arn}"
  desired_count   = 1
  iam_role        = "${aws_iam_role.ecs_service.name}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.booking_target_group.id}"
    container_name   = "booking"
    container_port   = "3001"
  }

  depends_on = [
    "aws_alb_listener.front_end_booking",
  ]
}
