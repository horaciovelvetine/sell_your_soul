require './config/environment'

class CorporationsController < ApplicationController

  # GET: /corporations
  get "/corporations" do
    @corporations = Corporation.all
    @sucker = current_sucker
    erb "/corporation/index"
  end




###### At Least to start out, these arent needed.

  # # GET: /corporations/5
  # get "/corporations/:id" do
  #   erb :"/corporations/show.html"
  # end

  #   # GET: /corporations/new
  # get "/corporation/new" do
  #   erb :"/corporations/new.html"
  # end

  # # POST: /corporations
  # post "/corporations" do
  #   redirect "/corporations"
  # end
  # # GET: /corporations/5/edit
  # get "/corporations/:id/edit" do
  #   erb :"/corporations/edit.html"
  # end

  # # PATCH: /corporations/5
  # patch "/corporations/:id" do
  #   redirect "/corporations/:id"
  # end

  # # DELETE: /corporations/5/delete
  # delete "/corporations/:id/delete" do
  #   redirect "/corporations"
  # end
end
