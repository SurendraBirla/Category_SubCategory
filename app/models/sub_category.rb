class SubCategory < ApplicationRecord
    

    def self.ransackable_attributes(auth_object = nil)
        ["category_id", "created_at", "description", "id", "id_value", "name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["category"]
    end

    belongs_to :category
    validates :name, presence: true
    validates :description, presence: true
    # validates :category_id
end
