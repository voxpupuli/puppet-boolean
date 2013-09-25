require 'puppet_x/util/boolean'
require 'puppet/property'

class Puppet::Property::Boolean < Puppet::Property
  include PuppetX::Util::Boolean

  # Determine if the boolean property is in sync.
  def insync?(is)
    munge(is) == should
  end
end
