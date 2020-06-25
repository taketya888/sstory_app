class Like < ApplicationRecord
  belongs_to :user 
  belongs_to :story
  counter_culture :story
  validates :user_id, presence: true
  validates :story_id, presence: true
end
