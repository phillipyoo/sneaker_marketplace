class WishlistController < ApplicationController
    def index
        @wishlist_items = current_user.wishlists
    end

    def add
        
        user = current_user
        
        item = user.wishlists.create(
            sneaker_id: params[:id]
        )
        if item.valid? && item.save
            flash[:notice] = "Added to wishlist"
            redirect_to wishlists_path
        else
            flash[:alert] = "Oops! There was a problem adding those sneakers"
            redirect_back(fallback_location: sneaker_path)
        end
    end
end
