require 'sinatra'
require 'json'
require "./lib/meme_generator"
require "./lib/directory_cleaner"

get '/' do
  'Hello World!'
end

post '/memegen' do
  json_params = JSON.parse(request.body.read)

  image = json_params['img'] ||
    "https://pbs.twimg.com/profile_images/378800000822867536/3f5a00acf72df93528b6bb7cd0a4fd0c.jpeg"
  header = json_params['header'] || "Yay it works"
  footer = json_params['footer'] || "by default"

  DirectoryCleaner::clean
  img = MemeGenerator::generate(image, header, footer)

  return "/meme/#{img}"
end
