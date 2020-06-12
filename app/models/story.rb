class Story < ApplicationRecord
  #acts_as_paranoid
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 50 }
  validates :start_text, presence: true, length: { maximum: 140 }
  validates :consent_text, presence: true, length: { maximum: 140 }
  validates :terning_text, presence: true, length: { maximum: 140 }
  validates :finish_text, presence: true, length: { maximum: 140 }
  
end
