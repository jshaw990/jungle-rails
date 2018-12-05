class Admin::CategoriesController < ApplicationController
    def index
        @categories = Category.all 
    end

    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(category_params)
        if @category.save
            redirect_to [:admin, :categories], notice: 'New Category Created'
        else
            render :new
        end
    end

    private

    def category_params
        puts 'params here', params
        params.require(:category).permit(:name)
    end

end