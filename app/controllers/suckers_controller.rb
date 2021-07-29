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
  get "/suckers/:id/edit" do
    erb :"/suckers/edit.html"
  end

  # PATCH: /suckers/5
  patch "/suckers/:id" do
    redirect "/suckers/:id"
  end

  # DELETE: /suckers/5/delete
  delete "/suckers/:id/delete" do
    redirect "/suckers"
  end
end
