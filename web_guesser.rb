require 'sinatra'

x = rand(100)

get '/' do
  "The secret number is #{x}!"
end
