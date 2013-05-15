# = Class: iptables::rules_from_hash
#
# This is a small class designed to allow realisation of
# iptables rules from a hash within hiera. Depending on
# hiera merge settings, this can merge rules from multiple
# levels.
class iptables::rules_from_hash (
  $rules          = params_lookup( 'rules', '', 'hash' ),
  $exported_rules = params_lookup( 'exported_rules', '', 'hash' ),
  $collect_tag    = params_lookup( 'collect_tag' ),
  $rule_defaults  = params_lookup( 'rule_defaults', '', 'hash' ),
) inherits iptables::params {
  include iptables

  create_resources('iptables::rule',$rules,$rule_defaults)
  create_resources('@@iptables::rule',$exported_rules,$rule_defaults)

  Iptables::Rule <<| tag == $collect_tag or tag == 'default' |>>
}