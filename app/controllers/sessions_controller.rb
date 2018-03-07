class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    resp = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV['GITHUB_ID'], client_secret:  ENV['GITHUB_SECRET'], code: params[:code]}, {'Accept' => 'application/json'}
    auth_hash = JSON.parse(resp.body)
    
  end
  
end