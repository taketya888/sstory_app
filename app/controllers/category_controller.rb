class CategoryController < ApplicationController
    
    def index
      @stories = Story.where(status: true)
      @categories = Category.all.order(created_at: :desc)
    end
end
