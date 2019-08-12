class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, through: :line_items

  def total
    self.line_items.sum {|line_item| line_item.quantity * line_item.item.price}
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.new(item_id: item_id)
    end
    line_item
  end

  def checkout
    self.status = "submitted"
    stock_update
  end

  def stock_update
     if self.status = "submitted"
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    end
  end

end
