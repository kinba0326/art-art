class AddIndexToArts < ActiveRecord::Migration[5.2]
  def change
    add_index :arts, :text, length: 32
  end
end
