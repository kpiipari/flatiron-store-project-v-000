class CartsController < ApplicationController
    before_action :current_cart

    def show
    end

    def checkout
        @current_cart.line_items.each do |line_item|
            @item = line_item.item
            @new_inventory = @item.inventory - line_item.quantity
            @item.inventory = @new_inventory
            @item.save
        end
        
        @current_cart.status = "submitted"
        @current_cart.save
        
        current_user.current_cart = nil
        current_user.save
        
        redirect_to cart_path(@current_cart)
    end

    private

    def current_cart
        @current_cart = current_user.current_cart
    end

end
