class Story < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :story_categories, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :categories, through: :story_categories
  validates :user_id, presence: true
  validates :title,   presence: true, length: { maximum: 50 }
  validates :start_text, presence: true, length: { maximum: 140 }
  validates :consent_text, presence: true, length: { maximum: 140 }
  validates :terning_text, presence: true, length: { maximum: 140 }
  validates :finish_text, presence: true, length: { maximum: 140 }
  scope :from_category, -> (category_id) { where(id: story_ids = StoryCategory.where(category_id: category_id).select(:story_id))}
  def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end
    
    new_tags.each do |new_name|
      story_category = Category.find_or_create_by(name:new_name)
      self.categories << story_category
    end
  end
  
  #def current_user_story?(story)
    #story.user_id == current_user.id
  #end
end
