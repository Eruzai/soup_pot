class User < ApplicationRecord

  before_destroy :destroy_recipes
  before_destroy :destroy_items

  has_secure_password

  has_many :recipes
  has_many :items
  
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

  private

  def destroy_recipes
    self.recipes.destroy_all
  end

  def destroy_items
    self.items.destroy_all
  end

end
