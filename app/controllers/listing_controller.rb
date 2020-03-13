class ListingController < ApplicationController
    def index
        @user = User.find(params[:id])
    end

    # Verifying a pair of sneakers and querying to whether to delete sneaker from wishlist
    def destroy
        user = current_user
        item_id = Sneaker.find(params[:id])
        Wishlist.where(sneaker_id: params[:id]).destroy_all
        item_id.destroy
        redirect_to user_path(user)
    end


end
