class SubCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :category
end
