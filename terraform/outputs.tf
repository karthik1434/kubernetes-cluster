output "public_ips" {
  value = concat(
    [aws_instance.master_node.public_ip],
    [for instance in aws_instance.worker_node : instance.public_ip]
  )
}
