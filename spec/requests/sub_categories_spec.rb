require 'rails_helper'

RSpec.describe "SubCategories", type: :request do

  describe "GET #index" do
    it 'return a list of subcategories' do
      get '/subcategories'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do 
    my_category = Category.create(name:"ABC",description:"fvndfjvn")
    it 'return a subcategory after creation' do
      # debugger
      post '/subcategories', params: {name:"SUB_ABC",description:"DEC_fvndfjvn", category_id:my_category.id}
      expect(response).to have_http_status(201)
      expect(SubCategory.find_by(name: 'SUB_ABC')).not_to be_nil
    end
  end

  describe "GET #show" do 
    my_category = Category.create(name:"ABC",description:"fvndfjvn")
    it 'return a requested subcategory ' do 
      subcategory = SubCategory.create(name:"SUB_ABC",description:"DESC_fvndfjvn", category_id: my_category.id)
      get '/subcategories', params: {subcategory_id: subcategory.id}
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do 
    my_category = Category.create(name:"ABC",description:"fvndfjvn")
    it "return a updated subcategory" do 
      # debugger
      subcategory = SubCategory.create(name:"SUB_ABC",description:"DESC_fvndfjvn", category_id: my_category.id)
      put "/subcategories/#{subcategory.id}", params: { name: "SUB_abc"}
      subcategory.reload
      expect(subcategory.name).to eq("SUB_abc")
    end
  end

  describe "DELETE #destroy" do 
   my_category = Category.create(name:"ABC",description:"fvndfjvn")
   subcategory = SubCategory.create(name:"SUB_ABC",description:"DESC_fvndfjvn", category_id: my_category.id)
   subcategory.reload
    it 'SubCategory should be deleted' do 
      # debugger
      delete "/subcategories/#{subcategory.id}"
      expect(response).to have_http_status(204)
    end
  end
end
