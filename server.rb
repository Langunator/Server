require 'sinatra'
require 'redis'
require "json"

redis = Redis.new

get '/' do
  redis.get('index') || {categories: ['']}
end

get 'category/:id' do
  redis.get("category_#{params[:id]}")
end