require './config/environment'

class SuckersController < ApplicationController

  get '/signup' do
    if logged_in?
      @sucker = current_sucker 
      redirect :'/sucker/#{@sucker.id}'
    else  
      @corporations = Corporation.all
      erb :'/sucker/create'
    end 
  end 

  post '/signup' do
    if params[:username] == "" || params[:password] == "" || params[:primary_email] == ""
      redirect :'/signup'
    elsif params[:username] == nil || params[:password] == nil || params[:primary_email] == nil
      redirect :'/signup'
    end
    
    @sucker = Sucker.new(:first_name => params["first_name"], :last_name => params["last_name"], :primary_email => params["primary_email"], :username => params["username"], :password => params["password"],:middle_name => params["middle_name"], :maiden_name => params["maiden_name"], :pseudonym => params["pseudonym"], :alias => params["alias"], :cell_phone_number => params["cell_phone_number"], :home_phone_number => params["home_phone_number"], :address_one => params["address_one"], :address_two => params["address_two"], :P_O_Box => params["p_o_box"], :secondary_email => params["secondary_email"], :spam_email => params["spam_email"], :yearly_income => params["yearly_income"], :social_security_number => params["social_security_number"], :primary_bank => params["primary_bank"], :credit_score => params["credit_score"], :relationship_status => params["relationship_status"], :employment_status => params["employment_status"], :employer => params["employer"], :catch_phrase => params["catch_phrase"], :political_affiliation => params["political_affiliation"], :belief_religion => params["belief_religion"], :interests => params["interests"], :additional_details_one => params["additional_details_one"], :additional_details_two => params["additional_details_two"])

    @corporation_ids = params[:corporations]
    @corporation_ids.each do |identifier|
      corp = Corporation.find_by_id(identifier)
      @sucker.corporations << corp
      
    end
    
    @sucker.save

    if @sucker.id != nil    
        session[:user_id] = @sucker.id  
        # flash[:message] = "Successfully created profile!"
        redirect :'/sucker/#{@sucker.id}'
      else
        # flash[:message] = "Looks like you already have an account. Please sign in!"
        redirect :'/login'
      end

    ##here build the redirect back to the page and the id/things
  end



  get '/suckers' do 
    if !logged_in?
      redirect :'/login'
    end
    @sucker = current_sucker
    redirect :'/sucker/#{@sucker.id}'
  end
  

  ## GETS: profile page for user.
  get '/sucker/:id' do
    if !logged_in? 
      redirect :'/login' 
    end 
    @sucker = Sucker.find_by_id(params[:id])    
    erb :'/sucker/show'
  end


  ## GETS: The form to edit a specific user
  get '/sucker/:id/edit' do 
    if !logged_in?
      redirect :'/login'
    end
    @sucker = current_sucker
    if params[:id] != @sucker.id
      flash[:message] = "Sorry, you can only edit your own profile!"
      redirect :'/sucker/#{@sucker.id}'
    else
      erb :'/sucker/edit'
    end
  end



  ## PATCHES: updates a sucker profile. 
  patch '/sucker/:id' do 
      @sucker = current_sucker  
      @sucker.update(params[:sucker])
      flash[:message] = "Successfully updated profile!"
      redirect :'/sucker/#{@sucker.id}'
  end

  ## DELETES: user profile,
  delete '/sucker/:id/delete' do
    if !logged_in?
        redirect :'/login'
    end
    

    @sucker = current_sucker
    if @sucker.balance < 0
      flash[:message] = "Sorry, you can't delete your profile with a negative balance!"
      redirect :'/sucker/#{@sucker.id}'
    elsif @sucker.balance > 0
      amount = @sucker.balance.to_s
      closing_transaction = Transaction.create(amount)
      if params[:id] != @sucker.id
        flash[:message] = "Sorry, profiles can only be deleted by the authenticated user!"
        redirect :'/sucker/#{@sucker.id}'
      else
        spam = spam.create(params[:sucker])
        session.clear
        @sucker.destroy 
        flash[:message] = "We're so sorry to see you go! But happy with the oppurtunity to earn your business back. Check your email(s) for a special offer." 
        redirect :'/'
      end
    end
  end

  private

  
end
