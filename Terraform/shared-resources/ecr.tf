resource "aws_ecr_repository" "demo" {
  name                 = "demo"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_iam_user" "github" {
  name = "github"
  path = "/system/"
}

resource "aws_iam_policy_attachment" "github" {
  name       = "github-ecr"
  users      = [aws_iam_user.github.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

data "aws_iam_policy_document" "main" {
  statement {
    sid    = "Test"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::927862243533:root"
      ]
    }
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer"
    ]
  }
}

resource "aws_ecr_repository_policy" "demo" {
  repository = aws_ecr_repository.demo.name
  policy     = data.aws_iam_policy_document.main.json
}
