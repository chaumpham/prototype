require "unirest"
require "pp"

while true
  system "clear"
  puts "Welcome to the Wardrobe Beta App!  Please select an option:"
  puts "[signup] Sign up (create a user)"
  puts "[login] Log in (create a jwt)"
  puts "[logout] Log out (destroy the jwt)"
  puts
  puts "[q] Quit"

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

    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bear #{jwt}")

    pp response.body

  elsif input_option == "logout"
    jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out successfully!"

  elsif input_option == "q"
    puts "Goodbye!"    
    break
  end
  
  puts "Press enter to continue"
  gets.chomp

end
