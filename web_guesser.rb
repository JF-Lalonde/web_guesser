require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params['guess'].to_i
  # message = check_guess(guess)
  if guess > number
    if guess - number > 5
      message = "Way too high!"
    else
      message = "Too High!"
    end
  elsif guess < number
    if guess - number < -5
      message = "Way too low!"
    else
      message = "Too Low!"
    end
  elsif guess == number
    message = "Right on brother!"
  end
  erb :index, :locals => {:number => number, :message => message}
end

# def check_guess(guess)
# end
