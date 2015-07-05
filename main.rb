require 'sinatra'
require 'json'
require "./lib/meme_generator"
require "./lib/directory_cleaner"

get '/' do
  'Hello World!'
end

get '/memegen' do
  image = params['img'] ||
    "yat"
  header = params['header'] || "Yay it works"
  footer = params['footer'] || "by default"

  DirectoryCleaner::clean
  img = MemeGenerator::generate(image, header, footer)

  path = "http://#{request.host_with_port}/meme/#{img}"
  return path
end

post '/memegen' do
  json_params = JSON.parse(request.body.read)

  image = json_params['img'] ||
    "yat"
  header = json_params['header'] || "Yay it works"
  footer = json_params['footer'] || "by default"

  DirectoryCleaner::clean
  img = MemeGenerator::generate(image, header, footer)

  path = "http://#{request.host_with_port}/meme/#{img}"
  return path
end
