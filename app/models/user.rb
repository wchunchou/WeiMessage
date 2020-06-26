class User < ApplicationRecord
    before_save { self.email = email.downcase }
    # self,email means this is reference to the object in the class
    has_many :messages, dependent: :destroy
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum:3, maximum: 25}

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { maximum: 105},
                      format: { with: VALID_EMAIL_REGEX}

    has_secure_password
    
end