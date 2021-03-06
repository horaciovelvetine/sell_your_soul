require './config/environment'
# require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ted cruz is the zodiac killer."
    # use Rack::Flash
  end


  ## GETS The homepage
  get "/" do
    if logged_in?
      @sucker = current_sucker
      redirect "/sucker/#{@sucker.id}"
    end
    erb :index
  end

  ## GETS the login page if not logged_in? already
  get '/login' do
    if logged_in?
      @sucker = current_sucker 
      redirect "/sucker/#{@sucker.id}"
    else  
      erb :'sucker/login'
    end 
  end 

  ## GETS a now logged out version of the homepage
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to "/sucker/login"
    else
      redirect to "/"
    end
  end

  ## POST(s) the information from the login form, and redirects now signed in user to thier home page
  post '/login' do
    

    @sucker = Sucker.find_by(username: params[:username])
    
    if @sucker && @sucker.authenticate(params[:password])
      session[:user_id] = @sucker.id 
      redirect "/sucker/:id"
    else 

      redirect "/sucker/login"
    end
    
  end
  
  #my legal defense
  get '/termsandconditions' do
    erb :terms
  end
  
  #helpers
  helpers do
    
    def logged_in?
      !!current_sucker
    end
    
    def current_sucker
      @current_sucker ||= Sucker.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end

