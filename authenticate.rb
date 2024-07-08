#  constant first letter needs to be capital
# ruby will allow you to change the value of constant but will give you a warning

EMAIL = "faiza@gmail.com"
PASSWORD = "f123"
PASSWORD_VAULT = {aws: {username: "faiza", password: "123456"}}

puts "Welcome to None Shall Pass - A Password Manager"
puts "Please sign in to continue"
print "Enter Email: "

user_email = gets.chomp
# adds a newline character at the end of the string when the user hit enter key
# to avoid that we can use chomp

if user_email == EMAIL
  print "Enter Password "
  user_pass = gets.chomp # this is not out of scope beyond this if else we can use it outside this
else
  puts "Invalid Email"
  exit

end

# if user_pass == PASSWORD
#   puts "Login Successful!"
# else
#   puts "Invalid Password"
#   exit
# end

#
#
#
#
# unless user_pass != PASSWORD # unless keyword is used to create conditional statements that execute code only if a specified condition is false. It's essentially the opposite of the if statement, which executes code when a condition is true.
#     puts "Hello, #{user_email}"
#     puts "What would you like to do?"
#     puts "1. Add new service credentials"
#    puts "2. Retrieve an existing services credentials"
#     puts "3.Exit"
#     user_option= gets.chomp
#
#     else
#       puts "Invalid Password"
#     exit
#
#   end

if user_pass != PASSWORD
  puts "Invalid Password"
  exit

else # unless keyword is used to create conditional statements that execute code only if a specified condition is false. It's essentially the opposite of the if statement, which executes code when a condition is true.
  puts "Hello, #{user_email}"
  puts "What would you like to do?"
  puts "1. Add new service credentials"
  puts "2. Retrieve an existing services credentials"
  puts "3.Exit"
  user_option = gets.chomp

end

case user_option
when "1"
  print "Enter the name of service "
  new_service = gets.chomp
  PASSWORD_VAULT[new_service] = {}

  print "Please input the username for this new service "
  new_service_uername = gets.chomp
  PASSWORD_VAULT[new_service]["username"] = new_service_uername

  print "Please input the password for this new service "
  new_service_password = gets.chomp
  PASSWORD_VAULT[new_service]["password"] = new_service_password
  p PASSWORD_VAULT

when "2"
  print "Enter the name of the service you wish to access credentials for: "
  req_service_name = gets.chomp
  credentials = PASSWORD_VAULT[req_service_name.to_sym]
  puts "Here are the credential for #{req_service_name}: "
  credentials.each do |key, value|
    puts "#{key}: #{value}"
  end

else
  puts "exiting the program, Goodbye."
  exit
end
