class Category < ApplicationRecord
    

    def self.ransackable_associations(auth_object = nil)
        ["sub_categories"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "name", "updated_at"]
    end

    has_many :sub_categories
    validates :name, presence: true
    validates :description, presence: true
end
