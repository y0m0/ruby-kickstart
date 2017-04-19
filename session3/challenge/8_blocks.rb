# This problem is based off of example 2
# Modify it so that it also tracks a person's age and a quote
# Allow any of these to be set with a hash as well, but the block should overwrite the hash
#
#
# EXAMPLE:
#
# artist = Person.new :name => 'Prince' do |person|
#   person.age   = 47
#   person.quote = "Why don't you purify yourself in the waters of Lake Minnetonka?"
# end
#
# artist.name   # => "Prince"
# artist.age    # => 47
#
# artist.name = 'The Artist Formarly Known As Prince'
# artist.age  = 1999
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 1999
#
# artist.reinit
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 47


class Person
  attr_accessor :name, :age, :quote

  def initialize(optional=Hash.new, &initializer)
    # assign name, age, and quote from hash if given
    @name = optional[:name]
    @age = optional[:age]
    @quote = optional[:quote]

    # assign an empty proc even if it's not given as argument so the call to the proc can happen anyway
    @initializer = (initializer || Proc.new { |person| })
    # call the &initialize proc (possibly overriding the info colleted from the optional hash)
    @initializer.call self
  end

  def reinit
    @initializer.call self
  end
end
