# Uses 2 sub folders to keep data. '/public' for stylesheets & images, and '/views' for Slim templates.
require 'sinatra'
require 'sinatra/reloader'  
require 'slim'

get '/' do 
  slim :index
end
