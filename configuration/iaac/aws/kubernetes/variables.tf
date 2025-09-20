variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default = "aws-k8s-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default = "vpc-0006e8e405df31ff3"
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
  default = [
    "subnet-039ca8f20a4aabb3d", "subnet-02e7cd1a51c151db2", 
    "subnet-0be34ce8277e946c6", "subnet-05f00ff03ad9f2534", "subnet-0899cc8c2ce6864f1"
  ]
}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
  default = {
    workers = {
      instance_types = ["t2.micro"]
      capacity_type  = "ON_DEMAND"
      scaling_config = {
        desired_size = 1
        max_size     = 1
        min_size     = 1
      }
    }
  }
}