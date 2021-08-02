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
      redirect :'/sucker/#{@sucker.id}'
    end
    erb :'index'
  end
  
  ## GETS (by frist double checking if you are already logged_in) Either a signup page, or directs back to sucker profile
  get '/signup' do
    if logged_in?
      @sucker = current_sucker 
      redirect :'/sucker/#{@sucker.id}'
    else  
      @corporations = Corporation.all
      erb :'/sucker/create'
    end 
  end 
  
  get '/termsandconditions' do
    erb :terms
  end

  ## GETS the login page if not logged_in? already
  get '/login' do
    if logged_in?
      @sucker = current_sucker 
      redirect :'/sucker/#{@sucker.id}'
    else  
      erb :'sucker/login'
    end 
  end 
  
  ## GETS a now logged out version of the homepage
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to :'/sucker/login'
    else
      redirect to :'/'
    end
  end

  ## POST(s) the information from the login form, and redirects now signed in user to thier home page
  post '/login' do
    
    @sucker = Sucker.find_by(username: params[:username])
    
    if @sucker && @sucker.authenticate(params[:password])
      session[:user_id] = @sucker.id 
      redirect :'/sucker/#{@sucker.id}'
    else 
      flash[:message] = "Sorry, the username or password do not match. Please try agin."
      redirect :'/sucker/login'
    end

  end


  helpers do

    def logged_in?
      !!current_sucker
    end

    def current_sucker
      @current_sucker ||= Sucker.find_by(id: session[:sucker_id]) if session[:sucker_id]
    end
  end
end

