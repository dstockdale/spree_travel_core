class AddLineItemIdToPax < ActiveRecord::Migration
  def change
    add_column :spree_paxes, :line_item_id, :intenger
  end
end
