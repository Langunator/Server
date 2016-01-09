require 'sinatra'
require 'redis'
require "json"
require "puma"

class Pumatra < Sinatra::Base

  redis = Redis.new

  get '/' do
    redis.get('index') || {categories: ['']}.to_json
  end

  get 'category/:id' do
    redis.get("category_#{params[:id]}")
  end
end

if __FILE__ == $0
  Pumatra.run!
end