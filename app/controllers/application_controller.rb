class ApplicationController < Sinatra::Base

    configure do
    #=> ask devon!
    # set :public_folder, 'public' 
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ted cruz is the zodiac killer."

  # GET: /domain
  get "/" do
    erb :"/index.html"
  end

    def logged_in?
      !!current_sucker
    end

    def current_sucker
      @current_sucker ||= Sucker.find_by(id: session[:sucker_id]) if session[:sucker_id]
    end
  end
end





  #   # GET: /domain/new
#   get "/domain/new" do
#     erb :"/domain/new.html"
#   end

#   # POST: /domain
#   post "/domain" do
#     redirect "/domain"
#   end

#   # GET: /domain/5
#   get "/domain/:id" do
#     erb :"/domain/show.html"
#   end

#   # GET: /domain/5/edit
#   get "/domain/:id/edit" do
#     erb :"/domain/edit.html"
#   end

#   # PATCH: /domain/5
#   patch "/domain/:id" do
#     redirect "/domain/:id"
#   end

#   # DELETE: /domain/5/delete
#   delete "/domain/:id/delete" do
#     redirect "/domain"
#   end
# end
