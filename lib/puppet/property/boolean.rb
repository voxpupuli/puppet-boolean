require 'puppet/property'

class Puppet::Property::Boolean < Puppet::Property
  # An actual boolean property.

  module Ontology
    # Hellooooo philosophy.

    # Determine truth.
    #
    # One must ask - what is true? Is truth subjective? Is your true my true?
    # Is the concept of truth the same across the universe?
    #
    # Of course, the answer is everything here and nothing else. Period.
    # THIS IS ALL THAT IS REAL.
    def true_values
      [true, 'true', :true, :yes, 'yes']
    end

    # Determine falsehood.
    #
    # Conversely, this is everything that is false. Because you can't have
    # nothing isn't, that would lead to all sorts of weird. Like gigantic ants
    # with top hats laying waste to Manhattan. That would be bad.
    def false_values
      [false, 'false', :false, :no, 'no', :undef, nil]
    end

    # Convert subjective values into absolutism.
    #
    # @param [Object] v Something that vaguely resembles a boolean
    #
    # @raise [ArgumentError] The supplied parameter cannot be normalized.
    #
    # @return [TrueClass]
    # @return [FalseClass]
    def munge(v)
      if true_values.include? v
        true
      elsif false_values.include? v
        false
      else
        raise ArgumentError, "Value '#{value}':#{value.class} cannot be determined as a boolean value"
      end
    end
  end

  include Ontology
  extend Ontology

  def self.defaultvalues
    newvalue(true)
    newvalue(false)

    aliasvalue(:true, true)
    aliasvalue(:false, false)

    aliasvalue('true', true)
    aliasvalue('false', false)

    aliasvalue(:yes, true)
    aliasvalue(:no, false)

    aliasvalue('yes', true)
    aliasvalue('no', false)

    # Ensure provided values are reasonable by trying to munge them, and if that
    # fails then let munge throw the exception and propagate that up.
    validate do |value|
      munge(value)
    end
  end

  # Determine if the boolean property is in sync.
  #
  # Really, what is? How do we determine what is?
  def insync?(is)
    munge(is) == should
  end
end

# This is the most smug code that I've ever written. I'm sorry.
