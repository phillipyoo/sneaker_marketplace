class WishlistController < ApplicationController
    def index
        @wishlist_items = current_user.wishlists

    end

    #Allows users to add sneakers to wishlist
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

    # Allows users to remove sneakers from wishlist
    def destroy
        user = current_user
        wishlist = user.wishlists
        item_id = wishlist.where(sneaker_id: params[:id]).first
        item_id.destroy
        flash[:notice] = "Item has been removed from your wishlist"
        redirect_to wishlists_path
    
    end

    protected
    def wishlist_params
        params.require(:sneaker).permit(:brand,:model,:sneaker_id,:search,:picture)
    end 

end
