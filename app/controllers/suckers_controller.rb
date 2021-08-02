# require './config/environment'

class SuckersController < ApplicationController


  get '/suckers' do 
    if !logged_in?
      redirect :'/login'
    end
    @sucker = current_sucker
    redirect :'/sucker/#{@sucker.id}'
  end
  

  ##work here
  post '/suckers' do

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
end
