require 'sinatra'
require 'sinatra/reloader'

get '/' do
  x = "secret number"
  "The #{x.upcase} is #{rand(0..100)}"
end
