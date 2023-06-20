output "instance_id" {
    description = "ID of the EC2 instance"
    value = [for instance in aws_instance.app_server : { id : instance.id }]
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = [for instance in aws_instance.app_server : { ip : instance.public_ip }]
}

/*output "instance_state" {
    description = "State of the EC2 instance"
    value = one(aws_ec2_instance_state.app_server[*].state)
}*/

output "security_group_ids" {
    description = "The ids of security groups that the instance is behind"
    value = [for instance in aws_instance.app_server : { sg_ids : instance.vpc_security_group_ids }]
}