require 'sinatra'
require 'sinatra/reloader'

  set :number, rand(101)

  get '/' do
    guess = params['guess'].to_i
    cheat = cheat_mode
    message = check_guess(guess)[0]
    reveal = check_guess(guess)[1]
    color = check_guess(guess)[2]
    erb :index, :locals => {reveal: reveal, message: message, color: color,
    cheat: cheat}
  end

  def cheat_mode
    if params['cheat'] == "true"
      "The number is #{settings.number} you CHEATER!"
    end
  end

  def check_guess(guess)
    if params['guess'].nil?
      return "", "", "white"
    elsif guess > settings.number
      return too_high(guess)[0], " ", too_high(guess)[1]
    elsif guess < settings.number
      return too_low(guess)[0], " ", too_low(guess)[1]
    elsif guess == settings.number
      return winner[0], answer, winner[1]
    end
  end

  def too_high(guess)
    if guess - settings.number > 5
      return "Way too high!", "red"
    else
      return "Too High!", "#F27989"
    end
  end

  def too_low(guess)
    if guess - settings.number < -5
      return "Way too low!", "red"
    else
      return "Too Low!", "#F27989"
    end
  end

  def winner
    return "Nicely done!", "green"
  end

  def answer
    "The SECRET NUMBER is  #{settings.number}"
  end
