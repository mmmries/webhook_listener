require "bundler/setup"
require "sinatra"
require "json"

post "/hook" do
  params = JSON.parse(request.body.read)
  p params
  "SUCCESS"
end
