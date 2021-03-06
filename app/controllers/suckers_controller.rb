require './config/environment'

class SuckersController < ApplicationController
  @@treasure = []
  #GETS: The signup page for new suckers
  get '/signup' do
    if logged_in?
      @sucker = current_sucker 
      redirect "/suckers/#{@sucker.id}"
    else  
      @corporations = Corporation.all
      erb :'/sucker/create'
    end 
  end 

  #POSTS: the signup action to the DB / moves user to next 
  post '/signup' do
    ##new pattern singup w/ validation
    @sucker = Sucker.new(params[:sucker])
    @corporation_ids = params[:corporations]
    @corporation_ids.each do |identifier|
      corp = Corporation.find_by_id(identifier)
      @sucker.corporations << corp
      @init_payout = 0
      
      @sucker.corporations.each do |corpo|
        @init_payout += corpo.payout_amount
      end
    end
    
    @sucker.balance = @init_payout
    
    if @sucker.save
      session[:user_id] = @sucker.id
      redirect "/sucker/#{@sucker.id}"
    else
      redirect "/signup"
    end
  end

  
  get '/profile' do
    if !logged_in? 
      redirect "/login"
    end

    redirect "/sucker/:id"
  end

## GETS: profile page for user.
  get '/sucker/:id' do
    if !logged_in? 
      redirect "/login"
    end 
    
    @sucker = current_sucker
    erb :'/sucker/show'
  end


  ## GETS: The form to edit a specific user
  get '/sucker/:id/edit' do 
    if !logged_in?
      redirect "/login"
    end 
    
    @sucker = current_sucker
    @corporations = Corporation.all
    @corp_ids = []
      
      @sucker.corporations.each do |corp|
        @corp_ids << corp.id
      end


    if session[:user_id] != @sucker.id
      redirect "/suckers/#{@sucker.id}"
    end
    
    erb :'/sucker/edit'

  end



  ## PATCHES: updates a sucker profile. 
  patch '/sucker/:id' do 
    
    @sucker = current_sucker  
    @sucker.update(params[:sucker])

    ##NEEDS TO ADD THE CORPORATION PATCH SEPERATELY
    @corporation_ids = params[:corporations]
    @corporation_ids.each do |identifier|
      corp = Corporation.find_by_id(identifier)
        if !@sucker.corporations.include?(corp)
          @sucker.corporations << corp
          @sucker.balance += corp.payout_amount
        end
      end

      @sucker.save

    redirect "/sucker/#{@sucker.id}"
  end

  ## DELETES: user profile,
  delete '/sucker/:id/delete' do
    if !logged_in?
        redirect "/login"
    end
    
    @sucker = current_sucker

    
    if @sucker.balance < 0
      # flash[:message] = "Sorry, you can't delete your profile with a negative balance!"
      redirect "/suckers/#{@sucker.id}"
    else
      booty = @sucker.balance
      @@treasure << booty
      @sucker.balance = 0
      spam = Spam.new(@sucker.attributes)
      session.clear
      @sucker.destroy 
      # flash[:message] = "We're so sorry to see you go! But happy with the oppurtunity to earn your business back. Check your email(s) for a special offer." 
      redirect :'/'
    end
  end


  private

    def journal_one
      puts "Aug 5, 2021. Dear journal. Its been a really hard week of learning sinatra. At least 5 seperate times I spent hours chasing down simple typing errors. Not big typing errors mind you, but little ones, like a v instead of an n, which in a block of text is really a hard to spot difference. Anyway, learning sinatra has been fun, I mean I managed to make this site, which taught me a lot, and at the same time make myself chuckle every time I wrote down @sucker(which was a lot of times). I'm not sure that I'll be back to sinatra in the future, but as far as stepping stones into Rails go, this is one of them. Stay golden pony-boy. "
    end


  
end
