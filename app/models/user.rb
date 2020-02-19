class User < ActiveRecord::Base
    has_secure_password

    has_many :user_games
    has_many :board_games, through: :user_games
    # ??? has_many :board_games
    has_many :owned_games, inverse_of: 'owner'
    
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def slug
        self.username.downcase.gsub(/\s+/, '-')
    end

    def self.find_by_slug(slug)
        self.all.find{ |user_slug| user_slug.slug == slug }
    end
end
