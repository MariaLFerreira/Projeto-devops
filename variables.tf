variable "awsprops" {
    type = map
    default = {
    region = "us-east-1"
    vpc = "vpc-06a8c2f9f11a5235c"
    ami = "ami-08d4ac5b634553e16"
    itype = "t3.medium"
    subnet = "subnet-0a53a675c605bbc4a"
    publicip = true
    keyname = "kube.pub"
    secgroupname = "kube-sg"
  }
}