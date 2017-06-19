require 'sinatra'

x = rand(100)

get '/' do
  "Your number is #{x}!"
end
