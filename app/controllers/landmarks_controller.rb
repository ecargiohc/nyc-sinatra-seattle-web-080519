class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do #list all landmarks
    @landmarks = Landmark.all
    # @figures = Figure.all
    erb :'/landmarks/index'
  end
 
  get '/landmarks/new' do #view form to create a new landmark
    erb :'landmarks/new'
  end

  post '/landmarks' do #create a new landmark 
    # @landmark = Landmark.find(params[:id]) <--not needed bc we want entire landmark hash (which is nested within 'params' hash)
    @landmark = Landmark.create(params[:landmark]) #this is the concept of 'mass assignment'
    #same thing as:
    #Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    #the HTTP attribute, 'name' grabs the landmark[:name] hash, etc,.
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do #see a single landmark
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do #view the form to edit a single landmark
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do #edit a single landmark
    #can use POST method also
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    #.update above does same thing as:
    #@landmark.name = params['landmark']['name']
    #@landmark.year_completed = params['landmark']['year_completed']
    #@landmark.save
    redirect "landmarks/#{@landmark.id}"
  end
end
