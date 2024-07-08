class User < ApplicationRecord

  mount_uploader :profile_img, UserProfileImageUploader

  has_secure_password

  has_many :recipes, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :friends, class_name: 'Friend', foreign_key: 'user_id', dependent: :destroy
  has_many :inverse_friends, class_name: 'Friend', foreign_key: 'friend_id', dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :events, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    formattedEmail = email.strip.downcase
    user = User.find_by_email(formattedEmail)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
