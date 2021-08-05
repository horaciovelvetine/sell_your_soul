require './config/environment'

class SuckersController < ApplicationController

  #GETS: The signup page for new suckers
  get '/signup' do
    if logged_in?
      @sucker = current_sucker 
      redirect :'/sucker/#{@sucker.id}'
    else  
      @corporations = Corporation.all
      erb :'/sucker/create'
    end 
  end 

  #POSTS: the signup action to the DB / moves user to next 
  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:primary_email] == ""
      redirect :'/signup'
    elsif params[:username] == nil || params[:password] == nil || params[:primary_email] == nil
      redirect :'/signup'
    end
    
    @sucker = Sucker.new(:first_name => params["first_name"], :last_name => params["last_name"], :primary_email => params["primary_email"], :username => params["username"], :password => params["password"],:middle_name => params["middle_name"], :maiden_name => params["maiden_name"], :pseudonym => params["pseudonym"], :alias => params["alias"], :cell_phone_number => params["cell_phone_number"], :home_phone_number => params["home_phone_number"], :address_one => params["address_one"], :address_two => params["address_two"], :p_o_box => params["p_o_box"], :secondary_email => params["secondary_email"], :spam_email => params["spam_email"], :yearly_income => params["yearly_income"], :social_security_number => params["social_security_number"], :primary_bank => params["primary_bank"], :credit_score => params["credit_score"], :relationship_status => params["relationship_status"], :employment_status => params["employment_status"], :employer => params["employer"], :catch_phrase => params["catch_phrase"], :political_affiliation => params["political_affiliation"], :belief_religion => params["belief_religion"], :interests => params["interests"], :additional_details_one => params["additional_details_one"], :additional_details_two => params["additional_details_two"])

    @corporation_ids = params[:corporations]
    @corporation_ids.each do |identifier|
      corp = Corporation.find_by_id(identifier)
      @sucker.corporations << corp
    end
    
    @init_payout = 0

    @sucker.corporations.each do |corpo|
      @init_payout += corpo.payout_amount
    end

    @sucker.balance = @init_payout
    @sucker.save

    if @sucker.id != nil    
        session[:user_id] = @sucker.id  
        redirect "/sucker/#{@sucker.id}"
      else
        redirect :'/login'
    end
  end
  

  ## GETS: profile page for user.
  get '/sucker/:id' do
    if !logged_in? 
      redirect :'/login' 
    end 
    
    @sucker = current_sucker
    erb :'/sucker/show'
  end


  ## GETS: The form to edit a specific user
  get '/sucker/:id/edit' do 
    if !logged_in?
      redirect :'/login' 
    end 
    
    @sucker = current_sucker
    @corporations = Corporation.all
    @corp_ids = []
      
      @sucker.corporations.each do |corp|
        @corp_ids << corp.id
      end


    if session[:user_id] != @sucker.id
      redirect :'/sucker/#{@sucker.id}'
    end
    
    erb :'/sucker/edit'

  end



  ## PATCHES: updates a sucker profile. 
  patch '/sucker/:id' do 
      @sucker = current_sucker  

      # binding.pry
      @sucker.update(params)
      @sucker.save
      redirect :'/sucker/#{@sucker.id}'
  end

  ## DELETES: user profile,
  delete '/sucker/:id/delete' do
    if !logged_in?
        redirect :'/login'
    end
    

    @sucker = current_sucker
    if @sucker.balance < 0
      # flash[:message] = "Sorry, you can't delete your profile with a negative balance!"
      redirect :'/sucker/#{@sucker.id}'
    elsif @sucker.balance > 0
      amount = @sucker.balance.to_s
      closing_transaction = Transaction.create(amount)
      if params[:id] != @sucker.id
        # flash[:message] = "Sorry, profiles can only be deleted by the authenticated user!"
        redirect :'/sucker/#{@sucker.id}'
      else
        spam = spam.create(params)
        session.clear
        @sucker.destroy 
        # flash[:message] = "We're so sorry to see you go! But happy with the oppurtunity to earn your business back. Check your email(s) for a special offer." 
        redirect :'/'
      end
    end
  end

  private

    def journal_one
      puts "Aug 5, 2021. Dear journal. Its been a really hard week of learning sinatra. At least 5 seperate times I spent hours chasing down simple typing errors. Not big typing errors mind you, but little ones, like a v instead of an n, which in a block of text is really a hard to spot difference. Anyway, learning sinatra has been fun, I mean I managed to make this site, which taught me a lot, and at the same time make myself chuckle every time I wrote down @sucker(which was a lot of times). I'm not sure that I'll be back to sinatra in the future, but as far as stepping stones into Rails go, this is one of them. Stay golden pony-boy. "
    end


  
end
