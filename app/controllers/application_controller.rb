require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  ## ACTING-HOMEPAGE 
  get "/" do
    erb :index
  end

  get "signup" do
    
    erb :signup
  end

    def logged_in?
    !!current_sucker
  end

  def current_sucker
    @current_sucker ||= Sucker.find_by(id: session[:sucker_id]) if session[:sucker_id]
  end
end

end
