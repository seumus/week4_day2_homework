require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require('json')
require_relative('./models/shoe.rb')


get '/orders/new' do
  erb(:new)
end

get '/orders/all' do
  @customers = Customer.all()
  erb(:index)
end

post '/orders' do
  @customer = Customer.new(params)
  @customer.save()
  erb(:create)
end
# binding.pry
# nil
