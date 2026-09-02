##############################################################################
# Redis variables
##############################################################################

variable "resource_group_id" {
  type        = string
  description = "The ID of the resource group to use for the Redis instance"
}

variable "redis_instance_name" {
  type        = string
  description = "Name of the Redis instance to create"
}

variable "region" {
  type        = string
  description = "Region where the Redis instance will be created"
}

variable "redis_version" {
  type        = string
  description = "Version of Redis to provision"
  default     = null
}

variable "redis_member_host_flavor" {
  type        = string
  description = "Host flavor for Redis members"
  default     = "multitenant"
}

variable "plan" {
  type        = string
  description = "The service plan for the Redis instance. Use 'standard-gen2' for IBM Cloud Databases Gen 2."
  default     = "standard-gen2"
  validation {
    condition     = contains(["standard", "standard-gen2"], var.plan)
    error_message = "Allowed values are 'standard' and 'standard-gen2'."
  }
}

variable "redis_service_endpoints" {
  type        = string
  description = "Service endpoints for the Redis instance. Gen 2 only supports 'private'."
  default     = "private"
  validation {
    condition     = var.redis_service_endpoints == "private"
    error_message = "Only 'private' is supported for Gen 2 Redis instances."
  }
}

variable "kms_key_crn" {
  type        = string
  description = "The CRN of the KMS key to use for encrypting the Redis instance"
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to the Redis instance"
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "Optional list of access tags to be added to the Redis instance"
  default     = []
}

variable "redis_deletion_protection" {
  type        = bool
  description = "Enable deletion protection for the Redis instance"
  default     = true
}
