# Decorator Pattern: Add functionality to objects dynamically
#
class Coffee
  def cost
    1.00
  end

  def description
    "Coffee"
  end
end

class WithMilk < Coffee
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 0.50
  end

  def description
    @coffee.description + ", Milk"
  end
end

class WithSugar < Coffee
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 0.25
  end

  def description
    @coffee.description + ", Sugar"
  end
end

my_coffee = Coffee.new
puts "Drink cost #{my_coffee.cost}"
puts  "Drink consist of #{my_coffee.description}"

your_coffee = WithMilk.new(WithSugar.new(Coffee.new))
puts "Drink cost #{your_coffee.cost}"
puts  "Drink consist of #{your_coffee.description}"

# Singleton Pattern: Create only one instance of a class
class Logger
  @instance = nil

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def initialize
    @logs = []
  end

  def log(message)
    @logs << "[#{Time.now}] #{message}"
  end

  def show_logs
    @logs.each { |log| puts log }
  end
end

logger1 = Logger.instance
logger2 = Logger.instance
logger3 = Logger.instance

logger1.log("Hello world")
logger2.log("Chiao world")
logger3.log("Привет мир")

logger1.show_logs

# Strategy Pattern: provides a way to change the behavior of a context object by changing its strategy implementation

class Context
  def initialize(strategy)
    @strategy = strategy
  end

  def strategy=(strategy)
    @strategy = strategy
  end

  def execute
    @strategy.execute
  end
end

class StrategyA
  def execute
    puts "Executing Strategy A"
  end
end

class StrategyB
  def execute
    puts "Executing Strategy B"
  end
end


# Context using StrategyA
context = Context.new(StrategyA.new)
context.execute

# Context switching to StrategyB
context.strategy = StrategyB.new
context.execute
