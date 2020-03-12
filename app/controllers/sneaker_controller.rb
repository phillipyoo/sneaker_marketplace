class SneakerController < ApplicationController
    def index
        @sneaker = Sneaker.search(params[:search])

       
    end

    def new
        @sneaker = Sneaker.new
    end

    def sell
        user = current_user
        @sneaker = user.sneakers.create(
            brand: params[:sneaker][:brand],
            model: params[:sneaker][:model],
            price: params[:sneaker][:price],
            size: params[:sneaker][:size],
        )
        @sneaker.picture.attach(params[:sneaker][:picture])

        if @sneaker.valid? && @sneaker.save
            redirect_to sneakers_path()
        else 
            render :new
        end
    end

    def show
        @sneaker = Sneaker.find(params[:id])
        @user = User.find(@sneaker.user_id)

    end

private 
    def sneaker_params
        params.require(:sneaker).permit(:brand,:model,:sneaker_id,:search)
    end

end


