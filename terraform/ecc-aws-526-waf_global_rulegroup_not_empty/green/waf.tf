resource "aws_waf_ipset" "this" {
  name = "526_ipset_green"

  ip_set_descriptors {
    type  = "IPV4"
    value = "1.1.1.0/24"
  }
}

resource "aws_waf_rule" "this" {
  name        = "526_waf_rule_green"
  metric_name = "526WafRuleMetricGreen"

   predicates {
    data_id = aws_waf_ipset.this.id
    negated = false
    type    = "IPMatch"
  }
  depends_on  = [aws_waf_ipset.this]
}

resource "aws_waf_rule_group" "this" {
  name        = "526_waf_rule_group_green"
  metric_name = "526WafRuleGroupMetricGreen"

  activated_rule {
    action {
      type = "ALLOW"
    }

    priority = 1
    rule_id  = aws_waf_rule.this.id
  }
}
