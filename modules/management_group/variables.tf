variable "management_groups" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
  }))
  description = "A map of management groups to be created"
}
