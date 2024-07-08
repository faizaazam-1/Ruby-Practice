EMAIL = "faiza@gmail.com"
PASSWORD = "f123"
PASSWORD_VAULT = {aws: {username: "faiza", password: "123456"}}

def welcome_message
  puts "Welcome to None Shall Pass - A Password Manager"
end

def prompt_user_email
  puts "Please sign in to continue"
  print "Enter Email: "
  gets.chomp
end

def verify_email(user_email)
  if user_email != EMAIL
    puts "Invalid email"
    exit
  end
end

def prompt_user_pass
  print "Enter Password "
  gets.chomp
end

def verify_password(user_pass)
  if user_pass != PASSWORD
    puts "Invalid password"
    exit
  end
end

def greet_user(user_email)
  puts "Hello, #{user_email}"
  puts "What would you like to do?"
end

def menu_options
  puts "1. Add new service credentials"
  puts "2. Retrieve an existing services credentials"
  puts "3.Exit"
end

def get_user_option
  gets.chomp
end

def handle_user_selection(user_option)
  case user_option
  when "1"
    new_service = set_new_service_name

    set_username_for(new_service)

    set_password_for(new_service)

    req_service_name = retrieve_service_name

    credentials = retrieve_service_credentials_for(req_service_name)

    display_service_credentials(req_service_name, credentials)

  when "2"

    req_service_name = retrieve_service_name

    credentials = retrieve_service_credentials_for(req_service_name)

    display_service_credentials(req_service_name, credentials)

  else
    exit_program
  end
end

def set_new_service_name
  print "Enter the name of service "
  new_service = gets.chomp
  PASSWORD_VAULT[new_service.to_sym] = {}
  new_service
end

def set_username_for(service)
  print "Please input the username for this new service "
  new_service_uername = gets.chomp
  PASSWORD_VAULT[service.to_sym][:username] = new_service_uername
end

def set_password_for(service)
  print "Please input the password for this new service "
  new_service_password = gets.chomp
  PASSWORD_VAULT[service.to_sym][:password] = new_service_password
end

def retrieve_service_name
  print "Enter the name of the service you wish to access credentials for: "
  gets.chomp
end

def retrieve_service_credentials_for(service_name)
  PASSWORD_VAULT[service_name.to_sym]
end

def display_service_credentials(service_name, credentials)
  puts "Here are the credential for #{service_name}: "
  credentials.each do |key, value|
    puts "#{key}: #{value}"
  end
end

def exit_program
  puts "Exiting the program, Goodbye"
  exit
end

welcome_message
user_email = prompt_user_email
verify_email(user_email)
user_pass = prompt_user_pass
verify_password(user_pass)

greet_user(user_email)
menu_options
user_option = get_user_option
handle_user_selection(user_option)
