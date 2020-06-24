class CategoryController < ApplicationController
    
    def index
      #@categories = Story.where(status: true).story_categories.categories
      @categories = Category.all.order(created_at: :desc)
    end
end
