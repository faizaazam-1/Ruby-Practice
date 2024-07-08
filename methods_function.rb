def say_hello(name)
  puts "hello, #{name}"
end

# we can call methods on objects
# when we call puts methos, we call it on implicit object
# i.e main
# self.puts("hello")

# multiple arguments
def say(greeting, name)
  puts "#{greeting}, #{name}"
end

# default argument values
def say1(greeting = "Hello", name)
  puts "#{greeting}, #{name}"
end

# argument are order dependant (faiza,hello)
# sol: Keyword Arguments
def say3(greeting:, name:)
  puts "#{greeting}, #{name}"
end
# funtion call: say(greeting:"hi", name:"faiza")
# funtion call: say(name:"faiza", greeting:"hi")
# now even if they are out of order, things will operate corectly

# default value in keyword arguments
def say4(name:, greeting: "hi")
  puts "#{greeting}, #{name}"
end

# implicit return values
# The last evaluated regular expression will be our return value

def abc
  puts "hi"
  5 + 5
end

# implicit return value would be 10
# if puts is the last regular expression then return value is nill

# explicit return value
def check_input(num)
  return 0 if num.nill? # nill evaluates to false
  num
end
# modifier form of if, we can write if at the end of the line then we will not have to use the keyword end
