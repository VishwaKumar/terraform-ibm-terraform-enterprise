##############################################################################
# IBM Cloud Database for Redis (Gen 2)
##############################################################################

module "icd_redis" {
  source             = "terraform-ibm-modules/icd-redis/ibm"
  version            = "2.13.6"
  resource_group_id  = var.resource_group_id
  name               = var.redis_instance_name
  region             = var.region
  plan               = var.plan
  redis_version      = var.redis_version
  member_host_flavor = var.redis_member_host_flavor
  service_endpoints  = var.redis_service_endpoints

  # KMS encryption — backup encryption key not supported by Gen 2
  use_ibm_owned_encryption_key = false
  kms_key_crn                  = var.kms_key_crn

  # Service credentials — Gen 2 only accepts "Manager" or "Writer" roles
  service_credential_names = [
    {
      name     = "tfe"
      role     = "Manager"
      endpoint = "private"
    }
  ]

  # Resource tags
  resource_tags = var.resource_tags
  access_tags   = var.access_tags

  # Deletion protection
  deletion_protection = var.redis_deletion_protection
}
