variable "elb_name"{
type = string
}
variable "az"{

 #default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  type=list
}
variable "timeout"{
 
type=number
 
}
