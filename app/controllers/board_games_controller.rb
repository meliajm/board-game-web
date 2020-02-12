class BoardGamesController < ApplicationController

  get '/games' do 
    # binding.pry
    if logged_in? 
        @user = current_user
        @games = BoardGame.all 
        # @games = BoardGame.all.select { |game| game.user_id == current_user.id } 
        erb :'board_games/games'
    else
        redirect to '/login'
    end
end

get '/games/new' do
    if logged_in? && session[:user_id] == current_user.id 
        @user = current_user
        erb :'board_games/new'
    else
        redirect to '/login'
    end
end

get '/games/saved' do
  if logged_in? 
    @user = current_user
    @games = BoardGame.all 
    binding.pry
    # @games = BoardGame.all.select { |game| game.user_id == current_user.id } 
    erb :'board_games/saved'
  else
    redirect to '/login'
  end
end

get '/games/:id/edit' do 
    @game = BoardGame.find_by(id: params[:id])
    # binding.pry
    if logged_in? #&& current_user.username == @game.user.username 
        erb :'board_games/edit'
    else
        redirect to '/login'
    end
end

patch '/games/:id' do 
    # binding.pry
    @game = BoardGame.find_by(id: params[:id])
    @game.update(name: params[:name], minimum_age: params[:minimum_age], difficulty: params[:difficulty], description: params[:description],
    game_length: params[:game_length], number_of_player: params[:number_of_player], setup_time: params[:setup_time])
    if logged_in? && params[:content] != "" #&& current_user.username == @game.user.username 
        # erb :'games/show'
        redirect to "/games/#{@game.id}"
    elsif
        redirect to "/games/#{@game.id}/edit"
    else
        redirect to '/login'
    end
end

get '/games/:id' do 
    @game = BoardGame.find_by(id: params[:id])
    # binding.pry
    if logged_in? #&& current_user.username == @game.user.username
        # binding.pry
        erb :'board_games/show'
    else
        redirect to '/login'
    end
end 

post '/games' do 
    # binding.pry
    if params[:content] == ""
        redirect to '/games/new'
    else
        @game = BoardGame.create(name: params[:name], minimum_age: params[:minimum_age], difficulty: params[:difficulty], description: params[:description],
        game_length: params[:game_length], number_of_player: params[:number_of_player], setup_time: params[:setup_time])
        current_user.board_games << @game
        # @game.save
        redirect to "/games/#{@game.id}"
    end
end

delete '/games/:id' do 
    @game = game.find_by(id: params[:id])
    # binding.pry
    if logged_in? #&& current_user.username == @game.user.username
        @game.delete
        redirect to '/games'
    end
end
end
