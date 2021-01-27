output "users_logins_passwords" {
  value = {
    for instance in aws_iam_user_login_profile.users_login :
    instance.user => instance.encrypted_password
  }
}

