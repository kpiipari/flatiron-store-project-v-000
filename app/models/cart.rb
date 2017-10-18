class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items

    def total
        total = 0
        self.line_items.map {|li| total += Item.find(li.item_id).price}
        total
    end

    def add_item(item)
        if self.line_items.exists?(item_id: item)
            line_item = LineItem.find_by(item_id: item)
        else
            self.line_items.build(cart_id: self.id, item_id: item) 
        end       
    end
end
