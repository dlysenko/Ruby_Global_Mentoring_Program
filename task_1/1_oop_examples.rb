# frozen_string_literal: true

# A PIE (Abstraction, Polimorphism, Inheritance, Encapsulation)

# ABSTRACTION: In OOP, abstraction refers to the concept of hiding the complex
# reality while exposing only the necessary parts. It's about creating simple
# interfaces that represent complex underlying code structures.
# Ruby achieves abstraction through the use of classes and modules.

# Below is example from my current project which represent resolving
# of ItemInterface for existing items in GraphQL. You could see hiding complex
# history method and using nested modules and included BaseInterface
# for symplicity and readability

# Example of ABSTRACTION:
# module Types
#   module Items
#     module ItemInterface
#       include Types::BaseInterface
#       description "Something that implements Item fields"
#       field :id, ID, null: false

#       # a lot of others fields
#       field :history, [Types::Items::ItemHistoryInterface], null: true
#       def history
#         Items::BuildsItemHistories.build(object)
#       end
#     end
#   end
# end

# POLYMORPISM is an OOP principle that allows a single method
# can operate on objects of multiple classes if they share a certain
# behavior or characteristic. Polymorphism can take various forms, such as
# the use of inheritance, where subclasses can override or extend behavior of
# their superclass, or through duck typing, where the object's ability to
# respond to a method is more important than its actual type.

# INHERITANCE allows a class to inherit behavior and characteristics
# from another class, known as the superclass.

# ENCAPSULATION is the practice of keeping the internal state and behaviors
# of an object hidden from the outside world. It is achieved primarily through
# the use of private and protected access modifiers which control where class
# methods and attributes can be accessed.

# Below we could see example of INHERITANCE and POLYMORPISM and ENCAPSULATION

# module Measurable wich will be mix-in in every class
module Measurable
  attr_accessor :weight

  def measure_weight
    if weight
      "#{@name} weighs #{weight}kg."
    else
      "The weight of #{@name} is unknown."
    end
  end
end

# Animal class top level documentation comment
class Animal
  include Measurable

  def initialize(name, sound)
    @name = name
    @sound = sound
  end

  def speak
    "#{@name} says #{@sound}"
  end
end

# Dog class top level documentation comment
class Dog < Animal
  def initialize(name)
    super(name, 'Gav!')
  end

  def play
    "#{@name} is catching up the stick"
  end

  def bark
    "#{@name} is barking"
  end

  # example of ENCAPSULATION, we are hiding implementation of grooming and
  # practicing tricks
  def prepare_for_show
    puts "#{@name} is preparing for a show:"
    groom
    practice_tricks
  end

  private

  def groom
    puts "____ #{@name} is being groomed"
  end

  def practice_tricks
    puts "____ #{@name} is practicing tricks"
  end
end

# Cat class top level documentation comment
class Cat < Animal
  def initialize(name)
    super(name, 'Myau!')
  end

  def play
    "#{@name} is catching the mouse!"
  end

  def meow
    "#{@name} is meowing!"
  end
end

# PretendAnimal class top level documentation comment
class PretendAnimal
  include Measurable

  def initialize(name, sound)
    @name = name
    @sound = sound
  end

  def speak
    "#{@name} says #{@sound}"
  end

  def play
    "#{@name} is playing with the cameras!"
  end
end

dog = Dog.new('Sharik')
puts dog.speak
puts dog.play
puts dog.bark
dog.weight = 15
puts dog.measure_weight
dog.prepare_for_show

cat = Cat.new('Murzik')
puts cat.speak
puts cat.play
puts cat.meow
puts cat.measure_weight

pretend_animal = PretendAnimal.new('BBC team', 'record')
puts pretend_animal.speak
puts pretend_animal.play
