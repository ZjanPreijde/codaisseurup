class ChangeTypeOfPriceInEvents < ActiveRecord::Migration[5.1]
  def up
    change_column :events, :price, :decimal
  end
  def down
    change_column :events, :price, :decimal, :precision => 5, :decimal => 2
  end
end
