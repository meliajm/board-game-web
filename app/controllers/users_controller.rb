class UsersController < ApplicationController 

  get '/' do 
      if logged_in?
          redirect to '/games'
      else
          erb :index
      end
  end

  get '/signup' do 
      if logged_in?
          redirect to '/games'
      else
          erb :'users/new'
      end
  end

  post "/signup" do 
      # if params[:username] == "" || params[:email] == "" || params[:password] == ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      if @user.valid?
          session[:user_id] = @user.id 
          redirect to '/games'
      else
          redirect to '/signup'
      end
  end

  get '/login' do 
      # @error_message = params[:error]
      if logged_in?
          redirect to '/games'
      else
          erb :'users/login'
      end
  end

  post '/login' do
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id 
          redirect to '/games'
      else
          redirect to '/signup' if !logged_in?
      end
  end

  get "/logout" do 
      if logged_in?
          session.clear
          redirect to "/login"
      else
          redirect to '/'
      end
  end

    # get '/games/:slug' do 
    #     @user = User.find_by_slug(params[:slug])
    #     # binding.pry
    #     erb :'users/show'
    # end

    delete '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        # binding.pry
        # so saved needs to be added to schema? or no?
        if logged_in? #&& current_user.username == @user.owner.username
            session.clear
            @user.delete
            redirect to '/games'
        end

    end







end