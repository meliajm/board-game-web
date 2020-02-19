require './config/environment'

class ApplicationController < Sinatra::Base
  #? register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #unless test?
    set :session_secret, "games_application_secret"
  end

  helpers do 
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    
  end

end
