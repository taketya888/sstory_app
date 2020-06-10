class Story < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :start_text, presence: true, length: { maximum: 140 }
  validates :consent_text, presence: true, length: { maximum: 140 }
  validates :terning_text, presence: true, length: { maximum: 140 }
  validates :finish_text, presence: true, length: { maximum: 140 }
end
