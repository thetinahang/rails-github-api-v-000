class RepositoriesController < ApplicationController
  def index
    resp = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.body = {"name": "#{params['name']}"}.to_json
      req.headers = {"Authorization": "token #{session[:token]}", "Accept": 'application/json'}
    end 
    redirect_to root_path
  end
end
