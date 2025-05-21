output "master_node_ip" {
  value = aws_instance.master_node.public_ip
}

output "worker_node_1_ip" {
  value = aws_instance.worker_node[0].public_ip
}

output "worker_node_2_ip" {
  value = aws_instance.worker_node[1].public_ip
}