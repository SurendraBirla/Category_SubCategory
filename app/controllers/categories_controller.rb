class CategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        @categories = Category.all.paginate(page: params[:page], per_page: 2)
        # @categories = Category.all
        render json: @categories
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category
        else
            render json: @category.errors.full_messages
        end
    end

    def show
        @category = Category.find(params[:id])
        render json: @category
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            render json: @category
        else
            render json: @category.errors.full_messages
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category 
            @category.destroy 
            render json: { message: "User has been successfully deleted"}
        else
            render json: { message: "User not exists...!"}
        end
    end

    private
    def category_params
        params.permit(:name, :description)
    end
end
