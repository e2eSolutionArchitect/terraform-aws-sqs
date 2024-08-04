
resource "aws_sqs_queue" "this" {
  name                              = var.sqs_name
  fifo_queue                        = var.fifo_queue
  kms_master_key_id                 = module.aws_kms.id
  kms_data_key_reuse_period_seconds = 300
  tags = merge(
    { "resourcename" = var.sqs_name }, var.tags
  )
}


module "aws_kms" {
  #source = "../aws-kms"
  source                  = "git::https://github.com/e2eSolutionArchitect/terraform-aws-kms.git?ref=v1.0.0"
  kms_name                = "encryption key for ${var.sqs_name}"
  kms_alias               = var.sqs_name
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled
  tags                    = var.tags
}