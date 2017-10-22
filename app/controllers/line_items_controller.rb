class LineItemsController < ApplicationController
    
    def create
        @user = current_user
        @item = params[:item_id]

        if @user.current_cart == nil
            @cart = @user.carts.create
            @cart.add_item(@item).save
            @user.current_cart = @cart
            @user.save
        else
            @cart = Cart.find_by(user_id: @user.id)
            @cart.add_item(@item)
            @cart.save
        end

        redirect_to cart_path(@user.current_cart)
        
    end
end
