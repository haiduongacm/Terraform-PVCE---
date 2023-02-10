output "vpce-api_id" {
  description = "get id vpce to serivce ecr api"
  value = aws_vpc_endpoint.ecr-api.id
}

output "vpce-api_dkr" {
  description = "get id vpce to serivce ecr api"
  value = aws_vpc_endpoint.ecr-dkr.id
}
