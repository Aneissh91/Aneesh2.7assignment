
# 1. EBS Volume (1 GB, same AZ as instance)
resource "aws_ebs_volume" "extra" {
  availability_zone = "ap-southeast-1a"
  size              = 1

  tags = {
    Name = "extra-volume"
  }
}



# 2. Attach EBS Volume to EC2
resource "aws_volume_attachment" "attach_extra" {
  device_name = "/dev/sdh" # Linux will map this to /dev/xvdh
  volume_id   = aws_ebs_volume.extra.id
  instance_id = aws_instance.example.id # instance created using EC2 terraform code
}
