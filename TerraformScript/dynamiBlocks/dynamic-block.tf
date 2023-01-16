variable "sg_ports"{
  
 type = list(numbers)
 description = "list of ingress ports"
 default = [8200, 8201, 8300, 9200, 9500]
  
}
