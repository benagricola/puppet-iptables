# = Class: iptables::rules_from_hash
#
# This is a small class designed to allow realisation of
# iptables rules from a hash within hiera. Depending on
# hiera merge settings, this can merge rules from multiple
# levels.
class iptables::rules_from_hash inherits iptables::params {
  include iptables

  $rules = hiera_hash("iptables::rules",$default_rules)
  create_resources('iptables::rule',$rules,$rule_defaults)
}