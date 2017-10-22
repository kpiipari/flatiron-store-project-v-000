class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items

    def total
        total = 0
        self.line_items.map {|li| total += (Item.find(li.item_id).price * li.quantity)}
        total
    end

    def add_item(item)

        if @line_item = self.line_items.find_by(item_id: item)
            @line_item.quantity += 1
            @line_item
        else
            @line_item = self.line_items.build(item_id: item)
        end      
    end

end
