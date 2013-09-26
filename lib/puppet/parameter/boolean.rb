require 'puppet_x/util/boolean'
require 'puppet/parameter'

class Puppet::Parameter::Boolean < Puppet::Paramter
  include PuppetX::Util::Boolean
end
