require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def guess_check(string_guess)
  if string_guess.to_i > NUMBER
    "Too high!"
  elsif string_guess.to_i < NUMBER
    "Too low!"
  elsif string_guess.to_i == NUMBER
    "You are correct! The secret number is #{NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = guess_check(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end
