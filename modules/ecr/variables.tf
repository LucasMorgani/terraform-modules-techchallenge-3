variable "repository_name" {
  description = "Nome do repositório ECR"
  type        = string
  default     = "teste"
}

variable "tags" {
  description = "Tags para aplicar ao repositório ECR"
  type        = map(string)
  default     = {}
}