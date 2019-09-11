class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do #list all figures
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do #view form to create a new figure
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  post '/figures' do #create a new figure with landmark
    @figure = Figure.create(params[:figure]) #allows you to create a new figure with a landmark
      # if !params["pet"]["name"].empty?
      #   @owner.pets << Pet.create(name: params["pet"]["name"])
    @title = Title.create(params[:figure]['title']) # create a new figure with a new title
    @landmark = Landmark.create(params[:figure]['landmark']) #create a new figure with a new landmark
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do #see a single Figure 
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do #view the form to edit a single landmark
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do #edit a single figure
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    redirect "figures/#{@figure.id}"
  end

end
    
    # @figure = Figure.create(params['figure']['name'])
    # titles = params['figure']['title_id']
    # if !titles.empty?
    #   i = 0
    #     while titles.length > i do
    #       FigureTitle.create(title_id: titles[i], figure_id: @figure.id)
    #     i += 1
    #     end
    # end
    # if !params[title][name].empty?
    #   @new_title = Title.create(name: params[title][name])
    #   FigureTitle.create(title_=id: @new_title.id, figure_id: @figure.id)
    # end
    # landmarks = params['figure']['landmark_id']
    # if !landmarks.empty?
    #   i = 0
    #     while landmarks.length > i do
    #       @new_landmark = Landmark.find(landmarks[i])
    #       @new_landmark.figure_id = @figure.id
    #       # FigureTitle.create(landmark_id: landmarks[i])
    #     i += 1
    #     end
    # end
    # if !params[landmark][name].empty? 
    #   Landmark.create(name: params[landmark][name], year_completed: params[landmark][year_completed], figure_id: @figure.id)
    # end
#     redirect '/figures/'
#   end

# end

  