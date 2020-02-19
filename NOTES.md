1. [x] need to connect to github
2. [x] to list all games with link to click on games to see more info and can edit, delete
3. [x] create games
4. []users can save board games from db to their games and make new games - is_saved boolean?
5. [x] scrape into format
6. [x] fix edit to populate form
7. [x] figure out check box-- to work

8. [] add search features
    def search_difficulity_players_age(diff:, num:, ages:)
        array_games = []
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.array_num_player.include?(num) && g.difficulty.include?(diff.capitalize) && g.minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i <= ages
                array_games << g.name
            end
        end
        array_games 
    end

    def search_number_players_array(num:)
        array_games = []
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.array_num_player.include?(num)
                array_games << g.name
            end
        end
        array_games
    end

    def search_difficulty(input:)
        input = input.capitalize
        array_games = []
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.difficulty.include?(input)
                array_games << g.name
            end
        end
        array_games
    end

9. [] populate form with logic to show saved? games???
10. [] use associations  
users can view all board games in db
11. [x] can delete user account
12. [x] can use slugs for board games to navigate 
13. [x] fix delete route for games




 <!--<p><%= "#{index+1}.  #{game.name}" %></p>-->
<!--<p><a href=<%="/games/#{game.id}"%>>View this game</a></p>-->
<!--<% end %>-->

how to put scraped data into app? - seed data?

