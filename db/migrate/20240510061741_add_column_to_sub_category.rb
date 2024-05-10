class AddColumnToSubCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :sub_categories, :description, :string
    add_reference :sub_categories, :category, null: false, foreign_key: true
  end
end
