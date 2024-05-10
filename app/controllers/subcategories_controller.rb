class SubcategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def index
        @sub_categories = SubCategory.all.paginate(page: params[:page], per_page: 3)
        render json: @sub_categories
    end

    def show
        @sub_category = SubCategory.find(params[:id])
        render json: @sub_category
    end

    def create
        @sub_category = SubCategory.new(sub_categories_params)
        if @sub_category.save 
            render json: @sub_category
        else
            render json: @sub_category.errors
        end
    end

    def update
        @sub_category = SubCategory.find(params[:id])
        if @sub_category.update(sub_categories_params)
            render json: @sub_category
        else
            render json: @sub_category.errors
        end
    end

    def destroy
        @sub_category = SubCategory.find(params[:id])
        if @sub_category
            render json: {message: 'SubCategory has been successfully deleted'}
        else
            render json: {error: "Subcategory not found"}
        end
    end

    private
    def sub_categories_params
        params.permit(:name, :description, :category_id)
    end
end
