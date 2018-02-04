require './config/environment'

class ApplicationController

	configure do
		set :public folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, 'mystical tasks'
	end

	get '/' do
		erb :index
	end

	helpers do 
		def redirect_if_not_logged_in
			if !logged_in?
				redirect "/login?error=You have to be logged in to do that!"
			end
		end 

		def logged_in? 
			!!session[:user_id]

		def current_user
			User.find(session[:user_id])
		end

	end

end 
