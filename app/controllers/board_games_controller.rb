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
        # binding.pry
        if logged_in? #&& session[:user_id] == current_user.id 
            @user = current_user
            erb :'board_games/new'
        else
            redirect to '/login'
        end
    end

    get '/games/saved' do
        if logged_in? 
            @user = current_user
            # need to work on association more
            @games = @user.owned_games
            # binding.pry
            # @games = BoardGame.all.select { |game| game.user_id == current_user.id } 
            erb :'board_games/saved'
        else
            redirect to '/login'
        end
    end

    get '/games/search' do 
        # binding.pry
        @user = current_user
        if logged_in? #&& current_user.username == @game.user.username
            # binding.pry
            erb :'board_games/search'
        else
            redirect to '/login'
        end
    end 

    

    get '/games/:slug/edit' do 
        @game = BoardGame.find_by_slug(params[:slug])
        @user = current_user
        # binding.pry
        if logged_in? #&& current_user.username == @game.owner.username 
            erb :'board_games/edit'
        else
            redirect to '/login'
        end
    end

    patch '/games/:slug' do 
        # binding.pry
        @game = BoardGame.find_by_slug(params[:slug])
        @game.update(name: params[:name], minimum_age: params[:minimum_age], difficulty: params[:difficulty], description: params[:description],
        game_length: params[:game_length], number_of_player: params[:number_of_player], setup_time: params[:setup_time], owner_id: params[:owner])
        if logged_in? #&& current_user.username == @game.owner.username
            # erb :'games/show'
            redirect to "/games/#{@game.slug}"
        elsif
            redirect to "/games/#{@game.slug}/edit"
        else
            redirect to '/login'
        end
    end

    get '/games/:slug' do 
        # binding.pry
        @user = current_user
        @game = BoardGame.find_by_slug(params[:slug])
        # binding.pry
        if logged_in? #&& current_user.username == @game.user.username
            # binding.pry
            erb :'board_games/show'
        else
            redirect to '/login'
        end
    end
    
    post '/games/search' do 
        @user = current_user
        @difficulty = params[:difficulty_input]
        @games_difficulty = BoardGame.search_by_difficulty(params[:difficulty_input])
        erb :'board_games/difficulty'
    end

    post '/games' do 
        @user = current_user
        if params[:name] == ""
            redirect to '/games/new'
        else
            @game = BoardGame.create(name: params[:name], minimum_age: params[:minimum_age], difficulty: params[:difficulty], description: params[:description],
            game_length: params[:game_length], number_of_player: params[:number_of_player], setup_time: params[:setup_time], owner_id: @user.id)
            # binding.pry

            # current_user.board_games << @game
            # @game.save
            redirect to "/games/#{@game.slug}"
        end
    end

    delete '/games/:slug' do 
        @user = current_user
        @game = BoardGame.find_by_slug(params[:slug])
        # binding.pry
        if logged_in? && current_user.username == @game.owner.username
            @game.delete
            redirect to '/games'
        end
    end

    # make helper methods

end
