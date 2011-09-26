class HomeController < ApplicationController
  def index
	@challenge = Challenge.new

  @current_users_challenges = if current_user
    current_user.started_challenges.includes([{:hookups => :user}, :completer])
  else
     []
  end
  
  @open_challenges = Challenge.opened

#	@graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])

#	@likes = @graph.get_connections("me", "likes")
#	@pic = @graph.get_picture("me")
  end

end
