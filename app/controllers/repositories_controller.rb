class RepositoriesController < ApplicationController
  def index
  	# get from api
  	resp = Faraday.get("https://api.github.com/users/#{session[:username]}/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'})
  	@repos = JSON.parse(resp.body)
  end

  def create
  	# where to post to api
  	resp = Faraday.post("https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'})
  	binding.pry
  	redirect_to root_path
  end

 #  private

 #  def repo_params
	# params.require(:name).permit(:name);
 #  end
end
