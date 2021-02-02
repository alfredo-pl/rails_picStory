class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: true}
    has_many :stories , dependent: :destroy

    def get_stories
        Story.references(:users).where(user_id: id)
    end
end
