require 'rails_helper'

RSpec.describe Category, type: :model do
   it 'is valid with all attributes ' do 
     category = Category.new(name:"ABC",description:"dfhb").save
     expect(category).to eq(true)
   end

   it 'is not valid without name ' do 
    category = Category.new(description:"dfhb").save
    expect(category).to eq(false)
   end

   it 'is not valid without description ' do 
    category = Category.new(name:"ABC").save
    expect(category).to eq(false)
   end
end
