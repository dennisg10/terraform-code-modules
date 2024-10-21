//output "id" {
//  description = "The IDs of the WAF policies"
//  value       = { for k, v in azurerm_web_application_firewall_policy.waf_policy : k => v.id }
//}
output "id" {
   value       = [for waf_policy in azurerm_web_application_firewall_policy.waf_policy : waf_policy.id]
}
output "waf_obj" {
  value = azurerm_web_application_firewall_policy.waf_policy
}