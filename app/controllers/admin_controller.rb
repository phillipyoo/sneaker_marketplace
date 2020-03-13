class AdminController < ApplicationController
    def edit
        @user = User.find(params[:id])
    end

    #Verifying a user and querying if user is blocked or unblocked
    def update
        p params[:id]
        user = User.find(params[:user][:id])
        user.block = !(user.block)
        user.save
        redirect_to administration_path
    end

    def index
        @user = User.all
        @sneaker = Sneaker.all
    end 
end
