class UserController < ApplicationController

    def index
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    # Validates params and saves data once everything is verified
    def update
        profile = current_user
        profile.update(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            location: params[:location],
            contact: params[:contact]
        )

        if profile.valid? && profile.save
            redirect_to root_path
        else
            render "edit"
        end
    end

end
 