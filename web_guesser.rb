require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def guess_check(string_guess)
  if string_guess.to_i < NUMBER && (string_guess.to_i - NUMBER).abs > 5
    "Way too low!"
  elsif string_guess.to_i > NUMBER && (string_guess.to_i - NUMBER).abs > 5
    "Way too high!"
  elsif string_guess.to_i > NUMBER
    "Too high!"
  elsif string_guess.to_i < NUMBER
    "Too low!"
  elsif string_guess.to_i == NUMBER
    "You are correct! The secret number is #{NUMBER}"
  end
end

def color_check(result)
  if (result == "Way too low!") || (result == "Way too high!")
    "#7f0303"
  elsif (result == "Too low!") || (result == "Too high!")
    "#f29d9d"
  else
    "#429b36"
  end
end

get '/' do
  guess = params["guess"]
  message = guess_check(guess)
  color = color_check(message)
  erb :index, :locals => {:number => NUMBER, :color => color, :message => message}
end
