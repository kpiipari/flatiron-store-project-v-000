class LineItemsController < ApplicationController
    
    def create

        if current_user.current_cart == nil
            @cart = Cart.create(user_id: current_user.id)
            @cart.add_item(params[:item_id]).save
            current_user.current_cart = @cart
            current_user.save
        else
            @cart = current_user.current_cart
            @line_item = @cart.add_item(params[:item_id])
            @line_item.save
        end

        redirect_to cart_path(current_user.current_cart)
        
    end
end
