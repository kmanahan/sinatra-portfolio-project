require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  get "animals/new" do 
    erb :new 
  end 
  
  post "/animals" do 
    @animal = Animal.create(params)
    redirect "/animals/#{@animal.id}"
  end 
  
  get "/animals" do 
    @animal = Animal.all
    erb :index 
  end 
  
  get "/animals/:id" do 
    @animal = Animal.find_by_id(params[:id])
    erb :show 
  end 
  
  get "/animals/:id/edit" do 
    @animal = Animal.find_by_id(params[:id])
    erb :edit 
  end 
  
  patch "/animals/:id" do 
   @animal = Animal.find_by_id(params[:id])
   @animal.name = params[:name]
   @animal.species = params[:species] 
   @animal.save 
   redirect to "/animals/#{@animal.id}"
  end 
  
  delete "/animals/:id" do 
    @animal = Animal.find_by_id(params[:id])
    @animal.delete 
    redirect to "/animals" 
  end 
end
