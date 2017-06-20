require 'sinatra'
require 'sinatra/reloader'

set :number, rand(100)

  get '/' do
    guess = params['guess'].to_i
    message = check_guess(guess)
    reveal = ""
    erb :index, :locals => {:reveal => reveal, :message => message}
  end


  def check_guess(guess)
    if guess > settings.number
      too_high(guess)
    elsif guess < settings.number
      too_low(guess)
    elsif guess == settings.number
      winner; show_answer
    end
  end

  def too_high(guess)
    if guess - settings.number > 5
      message = "Way too high!"
    else
      message = "Too High!"
    end
  end

  def too_low(guess)
    if guess - settings.number < -5
      message = "Way too low!"
    else
      message = "Too Low!"
    end
  end

  def winner
    message = "Nicely done!"
  end

  def show_answer
    reveal = "The SECRET NUMBER is  #{settings.number}"
  end
