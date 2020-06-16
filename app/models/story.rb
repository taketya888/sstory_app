class Story < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 50 }
  validates :start_text, presence: true, length: { maximum: 140 }
  validates :consent_text, presence: true, length: { maximum: 140 }
  validates :terning_text, presence: true, length: { maximum: 140 }
  validates :finish_text, presence: true, length: { maximum: 140 }
  
end
