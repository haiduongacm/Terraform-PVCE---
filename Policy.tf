provider "aws" {
  region = "ap-southeast-1"
}

module "vpce" {
  source             = "../module/vpce"
  vpc_id             = "vpc-008ff47fce4b220b6"
  subnet_ids         = ["subnet-0818c62fce0c6e142"]
  security_group_ids = ["sg-082585bbffaea34c0"]
}

resource "aws_iam_policy" "awsvpce" {
  name        = "VPCEECR"
  path        = "/"
  description = "policy for dev access to ECR via VPCE"
  depends_on  = [module.vpce]
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VPCEECR",
      "Effect": "Allow",
      "Action": [
        "ecr:PutImageTagMutability",
        "ecr:StartImageScan",
        "ecr:DescribeImageReplicationStatus",
        "ecr:ListTagsForResource",
        "ecr:UploadLayerPart",
        "ecr:BatchDeleteImage",
        "ecr:CreatePullThroughCacheRule",
        "ecr:ListImages",
        "ecr:BatchGetRepositoryScanningConfiguration",
        "ecr:DeleteRepository",
        "ecr:GetRegistryScanningConfiguration",
        "ecr:CompleteLayerUpload",
        "ecr:TagResource",
        "ecr:DescribeRepositories",
        "ecr:BatchCheckLayerAvailability",
        "ecr:ReplicateImage",
        "ecr:GetLifecyclePolicy",
        "ecr:GetRegistryPolicy",
        "ecr:PutLifecyclePolicy",
        "ecr:DescribeImageScanFindings",
        "ecr:GetLifecyclePolicyPreview",
        "ecr:CreateRepository",
        "ecr:DescribeRegistry",
        "ecr:PutImageScanningConfiguration",
        "ecr:GetDownloadUrlForLayer",
        "ecr:DescribePullThroughCacheRules",
        "ecr:GetAuthorizationToken",
        "ecr:PutRegistryScanningConfiguration",
        "ecr:DeletePullThroughCacheRule",
        "ecr:DeleteLifecyclePolicy",
        "ecr:PutImage",
        "ecr:BatchImportUpstreamImage",
        "ecr:UntagResource",
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:StartLifecyclePolicyPreview",
        "ecr:InitiateLayerUpload",
        "ecr:GetRepositoryPolicy",
        "ecr:PutReplicationConfiguration"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:SourceVpce": "${module.vpce.vpce-api_id}"
          "aws:SourceVpce": "${module.vpce.vpce-dkr_id}"
        }
      }
    }
  ]
}
POLICY
}
