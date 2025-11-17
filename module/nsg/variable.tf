variable "nsg_name" {   
    description = "The name of the network security group"   
    type        = string 
}

variable "resource_group_name" {   
    description = "The name of the resource group where the network security group will be created"   
    type        = string 
}   

variable "location" {   
    description = "The location of the network security group"   
    type        = string 
}

variable "tags" {   
    description = "A map of tags to assign to the network security group"   
    type        = map(string)   
    default     = {} 
}