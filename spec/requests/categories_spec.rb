require 'rails_helper'

RSpec.describe "Categories", type: :request do

  # category_params = {name:"ABC",description:"fvndfjvn"}

  describe "GET #index" do
    it 'return a list of categories' do
      get '/categories'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do 
    it 'return a category after creation' do
      # debugger
      post '/categories', params: {name:"ABC",description:"fvndfjvn"}
      expect(response).to have_http_status(201)
      expect(Category.find_by(name: 'ABC')).not_to be_nil
    end
  end

  describe "GET #show" do 
    it 'return a requested category ' do 
      category = Category.create(name:"ABC",description:"fvndfjvn")
      get '/categories', params: {category_id: category.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do 
    my_category = Category.create(name:"ABC",description:"fvndfjvn")
    it "return a updated category" do 
      # debugger
      put "/categories/#{my_category.id}", params: { name: "abc"}
      my_category.reload
      expect(my_category.name).to eq("abc")
    end
  end
  
  describe "DELETE #destroy" do 
   my_category = Category.create(name:"ABC",description:"fvndfjvn")
   my_category.reload
    it 'it should be deleted' do 
      # debugger
      delete "/categories/#{my_category.id}"
      expect(response).to have_http_status(204)
    end
  end

end
