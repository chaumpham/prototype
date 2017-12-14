require "unirest"
require "pp"

system "clear"
puts "Welcome to the Wardrobe Beta App!  Please select an option:"
puts "Option [signup]: Create an account" 
puts "Option [login]: Create a JSON web token"

input_option = gets.chomp

if input_option == "signup"
  params = {}
  puts "Enter your first name: "
  params[:first_name] = gets.chomp
  puts "Enter your last name: "
  params[:last_name] = gets.chomp
  puts "Enter your email:"
  params[:email] = gets.chomp
  puts "Enter your password:"
  params[:password] = gets.chomp
  puts "Confirm your password :"
  params[:password_confirmation] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  pp response.body

elsif input_option == "login"
  params = {}
  puts "Email: "
  params[:email] = gets.chomp
  puts "Password: "
  params[:password] = gets.chomp
  response = Unirest.post(
    "http://localhost:3000/user_token", 
    parameters: {auth: 
      {email: params[:email], password: params[:password]}
    }
  )
  pp response.body

  jwt = response.body["jwt"]
  Unirest.default_header("Authorization", "Bear #{jwt}")
end
