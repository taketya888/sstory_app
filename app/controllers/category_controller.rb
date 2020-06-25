class CategoryController < ApplicationController
    
    def index
      @categories = Category.where(status: true).order(created_at: :desc)
    end
    
end
