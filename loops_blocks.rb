# options for looping

# infinite loop

loop do
  puts "I'm looping..."
end

# times method
20.times do
  puts "I'm looping.."
end

1.upto(10) do
  puts "Going up!"
end

5.upto(100) { |n| puts n }

10.downto(2) { |n| puts n }

# while loop
num = 5
while num <= 50
  puts "not greater than or equal to 50 yet..."
  num += 1
end

# until loop
num = 5
until num > 50
  puts "Not there yet..."
  num += 1
end

# blocks
nums = [1, 2, 3, 4, 5, 6]
nums.each { |num| puts num }

# iterative methods

# each
# Purpose: The each method is used to iterate over each element in a collection (like an array or a hash) and perform an operation on each element.
# Return Value: It returns the original collection, not the results of the block's execution.
array = [1, 2, 3]
array.each do |number|
  puts number * 2
end
# Output: 2, 4, 6
# Return Value: [1, 2, 3]

# maps
# Purpose: The map method is used to transform each element in a collection and create a new array containing the transformed elements.
array = [1, 2, 3]
new_array = array.map do |number|
  number * 2
end
# new_array: [2, 4, 6]
# Return Value: [2, 4, 6]

neg_num = [-1, -2, -3, -4, -5]
pos_num = neg_num { |num| num.abs }

def some_numbers(arr_nums, &code_block) # & tells that it is a block
  arr_nums.each { |num| code_block.call(num) }
end

# function call
some_numbers(neg_num) { |num| puts num.abs }

# What Happens When the Code Runs:
# The some_numbers method is called with neg_num and a block.
# Inside the some_numbers method:
# The each method iterates over each element in neg_num.
# For each element (num), the block { |num| puts num.abs } is called with num as the argument.
# The block executes puts num.abs, which prints the absolute value of num

#
#
# yield method works same as like you have passed a block as an argument and calls that block
def some_num(arr_nums)
  arr_nums.each { |num| yield num }
end

# function call
some_numbers(neg_num) { |num| puts num.abs }

# store code blocks
print_capitalize_name = proc { |name| puts name.capitalize }

# function call
print_capitalize_name.call("collin")

#
#
# Passing the Proc to the Method and using call method
# Define the Proc
print_capitalize_name = proc { |name| puts name.capitalize }

# Define the method
def greet_person(name, &block)
  block.call(name)
end

# Call the method with the Proc
greet_person("collin", &print_capitalize_name)

#
#
# Passing the Proc to the Method and using yield method
# Define the Proc
print_capitalize_name = Proc.new { |name| puts name.capitalize }

# Define the method that uses `yield`
def greet_person(name)
  yield(name)
end

# Call the method with the Proc, using `&` to convert the Proc to a block
greet_person("collin", &print_capitalize_name)

["collin", "bob"].each(&print_capitalize_name)

["collin", "bob"].map { |name| name.capitalize }

# symbol to proc
["collin", "bob"].map(&:capitalize)
# or we can do it like this
capitalize_proc = Proc.new { |name| name.capitalize }
["collin", "bob"].map(&capitalize_proc)

def some_numm(arr_num, &code_block)
  arr_num.each { |num| code_block.call(num) if block_given? }
end

# function  call
some_numm(neg_num) # we will see no errors because of the if check

def some_numm(arr_num)
  arr_num.each { |num| yield(num) if block_given? }
end

# function  call
some_numm(neg_num) # we will see no errors because of the if check

# another way to create a block is Lambda
l = Lambda{ puts "hi" }

#another way to define lamba
#stabby lambda

stabby_lambda = ->{ puts "Stamby Lambda" }
stabby_lambda.call

stabby_lambda2 = ->(name){ puts "hey, #{name}"}
stabby_lambda2.call("faiza")
stabby_lambda2.call
#output : error argument missing

bid_farewell = Proc.new { |name| puts "goodbye, #{name}"}
bid_farewell.call
#output
#goodbye,

#one key difference between lambda and proc is that if we don't pass an arument to lambda it will throw us an error
#but if we do the same with proc , it will print the nill object

#next difference handles return

def proc_return_example
  puts "inside method body"
  p = Proc.new { return 5 }
  p.call
  puts "after proc call"
end

puts proc_return_example


def lambda_return_example
  puts "inside method body"
  l= ->{return 5}
  l.call
  puts "after lambda call"
  end 
  
  
  #Lambda: A lambda treats return as returning from the lambda itself, allowing the enclosing method to continue executing.
  #Proc: A proc treats return as returning from the enclosing method, causing the method to exit immediately.
    
  