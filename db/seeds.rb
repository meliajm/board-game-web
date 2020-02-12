# Student.create(name: "Melissa", grade: "10th")
    # t.string  "name"
    # t.integer "minimum_age"
    # t.string  "difficulty"
    # t.text    "description"
    # t.string  "game_length"
    # t.string  "number_of_player"
    # t.string  "setup_time"
    # t.string  "array_num_player"

    # 18. Bananagrams
    # The best word game
    
    # Players: 1-8 | Time to set up: Under 2 minutes | Time to play: 10-20 minutes | Complexity: Hard | Age: 7+
    

#     19. Scythe
# The best economy-based board game
# Players: 1 - 5 | Difficulty: Moderate | Time to set up: 10 minutes | Time to play: 120 minutes | Age: 14+
BoardGame.create(name: "Scythe", minimum_age: 14, difficulty: "Moderate", description: "The best economy-based board game",
                    game_length: "120 minutes", number_of_player: "1 - 5", setup_time: "10 minutes")

BoardGame.create(name: "Bananagrams", minimum_age: 7, difficulty: "Hard", description: "The best word game",
                    game_length: "10-20 minutes", number_of_player: "1-8", setup_time: "Under 2 minutes")

User.create(username: "Bananagrams", email: "captain@mycaptain.com", password: "c")