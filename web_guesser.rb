require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params['guess'].to_i
  # message = check_guess(guess)
  if guess > number
    message = "Too High!"
  elsif guess < number
    message = "Too Low!"
  elsif guess == number
    message = "Right on brother!"
  end
  erb :index, :locals => {:number => number, :message => message}
end

# def check_guess(guess)
# end
