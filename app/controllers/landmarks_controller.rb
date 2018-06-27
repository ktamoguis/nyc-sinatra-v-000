class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    
    erb :'landmarks/index'
  end


end
