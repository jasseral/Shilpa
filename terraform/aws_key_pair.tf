resource "aws_key_pair" "my_pair_key" {
  key_name   = "default_pair_key"
  public_key = file("~/.ssh/aws.pub")
}
