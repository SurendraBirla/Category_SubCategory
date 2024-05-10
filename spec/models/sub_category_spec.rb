require 'rails_helper'

RSpec.describe SubCategory, type: :model do

  category = Category.create(name:"ABC",description:"dfhb")

  it 'is valid with all attributes ' do 
    sub_category = SubCategory.new(name:"sub-abc",description:"desc-fdf",category_id:category.id).save
    expect(sub_category).to eq(true)
  end

  it 'is not valid without name ' do 
    sub_category = SubCategory.new(description:"desc-fdf",category_id:category.id).save
    expect(sub_category).to eq(false)
  end

  it 'is not valid without description ' do 
    sub_category = SubCategory.new(name:"sub-abc",category_id:category.id).save
    expect(sub_category).to eq(false)
  end

  it 'is not valid without category id ' do 
    sub_category = SubCategory.new(name:"sub-abc",description:"desc-fdf").save
    expect(sub_category).to eq(false)
  end

end
