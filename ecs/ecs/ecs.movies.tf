## ECS





data "template_file" "task_definition_movies" {
  template = "${file("${path.module}/task-definition.movies.json")}"

  vars = {
    image_url        = "${var.movie_image_url}"
    container_name   = "movies"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.movieapp.name}"
  }
}

resource "aws_ecs_task_definition" "movie_task" {
  family                = "movie-task"
  container_definitions = "${data.template_file.task_definition_movies.rendered}"
}

resource "aws_ecs_service" "movie_service" {
  name            = "movie-service"
  cluster         = "${aws_ecs_cluster.main.id}"
  task_definition = "${aws_ecs_task_definition.movie_task.arn}"
  desired_count   = 1
  iam_role        = "${aws_iam_role.ecs_service.name}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.movie_target_group.id}"
    container_name   = "movies"
    container_port   = "3000"
  }

  depends_on = [
    "aws_alb_listener.front_end_movie",
  ]
}
