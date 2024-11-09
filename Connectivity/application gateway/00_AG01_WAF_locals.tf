locals {

  waf_policies = [
    {
      name = "global-policy"
      policy_settings = {
        mode                             = "Detection"
        file_upload_limit_in_mb          = 100
        request_body_check               = true
        max_request_body_size_in_kb      = 128
        request_body_inspect_limit_in_kb = 128
      }

      managed_rule_set = {
        type    = "OWASP"
        version = "3.2"
      }
      rules        = []
      custom_rules = []

    },
    {
      name = "sta-acc.nl"
      policy_settings = {
        mode                             = "Prevention"
        file_upload_limit_in_mb          = 100
        request_body_check               = true
        max_request_body_size_in_kb      = 128
        request_body_inspect_limit_in_kb = 128
      }

      managed_rule_set = {
        type    = "OWASP"
        version = "3.2"
      }
      rules = [
        {
          rule_group_name = "REQUEST-942-APPLICATION-ATTACK-SQLI"
          rule_id         = "942100"
          rule_enabled    = false
          rule_action     = "Block"
        },

      ]
      custom_rules = [
        {
          name      = "BlockIP"
          enabled   = true
          priority  = 1
          rule_type = "MatchRule"
          action    = "Block"
          match_conditions = [
            {
              match_variables = [
                {
                  variable_name = "RemoteAddr"
                  selector      = ""
                }
              ]
              operator           = "IPMatch"
              negation_condition = false
              transforms         = []
              match_values       = ["192.168.1.0/24"]
            }
          ]
        }
      ]
    }
  ]
}
