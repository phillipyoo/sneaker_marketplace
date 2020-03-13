class Sneaker < ApplicationRecord
    belongs_to :user
    has_one_attached :picture

    #Implementing "fuzzy" allows user to easily search a sneaker without typing in the exact words
    def self.search(search)
        if search
            result = self.where("LOWER(brand) LIKE ?", "%#{search.downcase}%")
            if result.length > 0
                return result
            else
                result = self.where("LOWER(model) LIKE ?", "%#{search.downcase}%")
                return result
            end
        else
            Sneaker.all
        end
    end
end
