class BoardGame < ActiveRecord::Base
    # ??? 
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
    has_many :user_games
    has_many :users, through: :user_games

    def slug
        self.name.downcase.gsub(/\s+/, '-')
    end

    def self.find_by_slug(slug)
        self.all.find{ |user_slug| user_slug.slug == slug }
    end
end
