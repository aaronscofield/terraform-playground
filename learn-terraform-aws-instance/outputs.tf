output "instance_id" {
    description = "ID of the EC2 instance"
    value = aws_instance.app_server.id
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.app_server.public_ip
}

output "instance_state" {
    description = "State of the EC2 instance"
    value = aws_ec2_instance_state.app_server.state
}

output "security_group_ids" {
    description = "The ids of security groups that the instance is behind"
    value = aws_instance.app_server.vpc_security_group_ids
}