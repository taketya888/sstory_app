class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :stories_categorise
  has_many :stories, through: :stories_categorise
end
