class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  # 유저가 탈퇴하면 글들도 다지워지게 만듬
  before_save { self.email = email.downcase }
  validates :username, presence: true,
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i         
  validates :email, presence: true, length: { maximum: 105},
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
    
  has_secure_password
end