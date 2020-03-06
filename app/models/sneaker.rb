class Sneaker < ApplicationRecord
    belongs_to :user
    has_one_attached :picture

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
