class Item < ApplicationRecord

  belongs_to :user
  
  validates :name, presence: true
  validates :quantity, presence: true
  validates :expiration_date, presence: true
end
