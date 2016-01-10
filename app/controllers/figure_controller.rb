require 'pry'

class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]
    @figure.save
    @figure.landmarks << Landmark.find_or_create_by(name: params[:figure][:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
