class SubcategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def index
        @sub_categories = SubCategory.all.paginate(page: params[:page], per_page: 3)
        render json: @sub_categories, status: :ok
    end

    def show
        @sub_category = SubCategory.find(params[:id])
        render json: @sub_category, status: :ok
    end

    def create
        @sub_category = SubCategory.new(sub_categories_params)
        if @sub_category.save 
            render json: @sub_category, status: :created
        else
            render json: @sub_category.errors
        end
    end

    def update
        @sub_category = SubCategory.find(params[:id])
        if @sub_category.update(sub_categories_params)
            render json: @sub_category, status: :ok
        else
            render json: @sub_category.errors, status: :not_found
        end
    end

    def destroy
        @sub_category = SubCategory.find(params[:id])
        if @sub_category
            render json: {message: 'SubCategory has been successfully deleted'}, status: :no_content
        else
            render json: {error: "Subcategory not found"}, status: :not_found
        end
    end

    private
    def sub_categories_params
        params.permit(:name, :description, :category_id)
    end
end
