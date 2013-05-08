# = Class: iptables::rules_from_hash
#
# This is a small class designed to allow realisation of
# iptables rules from a hash within hiera. Depending on
# hiera merge settings, this can merge rules from multiple
# levels.
class iptables::rules_from_hash (
  $rules          = params_lookup( 'rules', '', 'hash' ),
  $rule_defaults  = params_lookup( 'rule_defaults', '', 'hash' ),
) inherits iptables::params {
  include iptables

  create_resources('iptables::rule',$rules,$rule_defaults)
}