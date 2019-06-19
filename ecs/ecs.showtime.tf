## ECS





data "template_file" "task_definition_showtime" {
  template = "${file("${path.module}/task-definition.showtime.json")}"

  vars = {
    image_url        = "${var.showtime_image_url}"
    container_name   = "showtime"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.showtimeapp.name}"
  }
}

resource "aws_ecs_task_definition" "showtime_task" {
  family                = "showtime-task"
  container_definitions = "${data.template_file.task_definition_showtime.rendered}"
}

resource "aws_ecs_service" "showtime_service" {
  name            = "showtime-service"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.showtime_task.arn}"
  desired_count   = 1
  iam_role        = "${aws_iam_role.ecs_service.name}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.showtime_target_group.id}"
    container_name   = "showtime"
    container_port   = "3000"
  }

  depends_on = [
    "aws_alb_listener.front_end_showtime",
  ]
}
