resource "aws_redshiftserverless_namespace" "crypto_redshiftserverless" {
    namespace_name = "crypto-redshiftwarehouse"
    db_name = "crypto_db"
    admin_username = "admin"
    manage_admin_password = true
    iam_roles = [aws_iam_role.crypto_role.arn]
}

resource "aws_redshiftserverless_workgroup" "crypto_redshiftserverless_workgroup" {
    workgroup_name = "crypto-redshiftwarehouse-workgroup"
    namespace_name = aws_redshiftserverless_namespace.crypto_redshiftserverless.namespace_name
    base_capacity = 32
    enhanced_vpc_routing = true
    publicly_accessible = true
}

output "redshift_admin_secret_arn" {
    value = aws_redshiftserverless_namespace.crypto_redshiftserverless.admin_password_secret_arn
    sensitive = true
}