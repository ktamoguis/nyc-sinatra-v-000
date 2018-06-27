class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(params[:landmark])
    @landmark.save

  end


end
