output "id" {
  description = "id"
  value       = try(aws_sqs_queue.this.id, "")
}

output "arn" {
  description = "arn"
  value       = try(aws_sqs_queue.this.arn, "")
}