class User < ApplicationRecord
  has_secure_password

  validates :name, 
    presence: true, 
    length: { maximum: 20, minimum: 4 },
    format: {
      with: /\A[a-zA-Z][a-zA-Z0-9]*\z/,
      allow_blank: true
    },
    uniqueness: true
  
  validates :email, email: { allow_blank: true }

  attr_accessor :current_password
  validates :password, presence: [if: :current_password]   

  class << self
    def search(query)
      rel = all
      if query.present?
        rel = User.where("name LIKE ?", "%#{query}%")
      end
      rel
    end
  end
end
