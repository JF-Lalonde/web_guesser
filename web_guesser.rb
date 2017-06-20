require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

before '/' do
  params['guess'] ||= "default"
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  reveal = ""
  erb :index, :locals => {:reveal => reveal, :message => message}
end

def check_guess(guess)
  if guess.class != Fixnum
    message = "whatever"
  elsif guess > SECRET_NUMBER
    if guess - SECRET_NUMBER > 5
      message = "Way too high!"
    else
      message = "Too High!"
    end
  elsif guess < SECRET_NUMBER
    if guess - SECRET_NUMBER < -5
      message = "Way too low!"
    else
      message = "Too Low!"
    end
  elsif guess == SECRET_NUMBER
    message = "Nicely done!"
    reveal = "The SECRET NUMBER is  #{SECRET_NUMBER}"
  end
end
