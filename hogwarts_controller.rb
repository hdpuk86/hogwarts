require 'sinatra'
require 'sinatra/contrib/all'


require_relative './models/student.rb'
require_relative './models/house.rb'


get '/home' do
  erb(:home)
end

get '/students' do
  @students = Student.all()
  erb(:students)
end

get '/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end
