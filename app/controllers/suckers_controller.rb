class SuckersController < ApplicationController

  # GET: /suckers
  get "/suckers" do
    erb :"/suckers/index.html"
  end

  # GET: /suckers/new
  get "/suckers/new" do
    erb :"/suckers/new.html"
  end

  # POST: /suckers
  post "/suckers" do
    redirect "/suckers"
  end

  # GET: /suckers/5
  # should find currently logged in user, get thier profile, then show that information
  # otherwise redirect to the login page
  get "/suckers/:id" do
    erb :"/suckers/show.html"
  end

  # GET: /suckers/5/edit
  # Gets the edit form from views
  get "/suckers/:id/edit" do
    erb :"/suckers/edit.html"
  end

  # PATCH: /suckers/5
  #called by edit form in order to actually execute the action
  patch "/suckers/:id" do
    if logged_in?

      #Validates content has been added to the suckers.
      if params[:TEMPORARY] == ""
        #empty go here
        redirect to "/suckers/#{params[:id]}/edit"
      else
        #check for access to profile
        @sucker = Sucker.find_by_id(params[:id])
        if @sucker && @sucker.username == current_user

          if @sucker.update(content: params[:content])
            redirect to "/suckers/#{@sucker.id}"
          else
            redirect to "/suckers/#{@sucker.id}/edit"
          end
        else
          redirect to '/suckers'
        end
      end
    else
      redirect to '/login'
    end
    
    
    
    
    redirect "/suckers/:id"
  end

  # DELETE: /suckers/5/delete
  delete "/suckers/:id/delete" do
    redirect "/suckers"
  end




################################################################################
################################################################################
                            #LOGIN & LOGOUT PATHS
  get '/login' do
    if !logged_in?
      erb :'suckers/login'
    else

      redirect to '/suckers/#{:id}'
    end
  end

  post '/login' do
  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to "/TEMPORARY"
  else
    redirect to '/signup'
  end
  
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
  
end
