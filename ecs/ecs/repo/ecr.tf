resource "aws_ecr_repository" "aniket-app-repository" {
  name = "aniket-app-repository"
}

output "ecr-repo-url" {
  value = "${aws_ecr_repository.aniket-app-repository.repository_url}"
}
