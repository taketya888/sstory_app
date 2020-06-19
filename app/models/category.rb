class Category < ApplicationRecord
    validates :name, presence: true, length:{maximum:50}
    has_many :stories_categorise, dependent: :destroy
    has_many :stories, through: :stories_categorise
end
