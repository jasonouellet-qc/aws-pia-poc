resource "aws_iam_group" "users_groups" {
  for_each = var.aws_groups

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 12
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  max_password_age               = 30
  password_reuse_prevention      = 5
  allow_users_to_change_password = true
}

resource "aws_iam_user" "users" {
  for_each = var.aws_users

  name = each.value.name
  path = each.value.path
  #  force_destroy = true

  tags = var.tags
}

resource "aws_iam_user" "users_service" {
  for_each = var.aws_users_service

  name = each.value.name
  path = "/services/"
  #  force_destroy = true

  tags = var.tags
}

resource "aws_iam_user_login_profile" "users_login" {
  depends_on = [aws_iam_user.users]
  for_each   = aws_iam_user.users

  user                    = each.value.name
  pgp_key                 = "keybase:jasonouellet"
  password_reset_required = true
}

resource "aws_iam_group_membership" "group_members" {
  depends_on = [aws_iam_user.users, aws_iam_user.users_service, aws_iam_group.users_groups]

  for_each = var.aws_groups

  name = "${each.value.name}_members"
  users = concat([for x in var.aws_users : x.name if x.group == each.value.name],
    [for x in var.aws_users_service : x.name if x.group == each.value.name]
  )
  group = each.value.name
}

resource "aws_iam_group_policy_attachment" "group_policy_att" {
  depends_on = [aws_iam_group.users_groups]

  for_each   = var.aws_groups
  group      = each.value.name
  policy_arn = each.value.policy_arn
}

