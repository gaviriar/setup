instance_id=$(aws ec2 run-instances --region us-west-2 --image-id ami-d732f0b7 --count 1 --instance-type t2.micro --key-name k1 --query 'Instances[0].InstanceId')
echo instance_id:$instance_id
aws ec2 wait instance-running --region us-west-2 --instance-ids $instance_id
ip_address=$(aws ec2 describe-instances --region us-west-2 --instance-ids $instance_id --query 'Reservations[0].Instances[0].PublicIpAddress')
echo ip_address:$ip_address
ssh --region us-west-2 -i ~/.ssh/k1.pem ubuntu@$ip_address
