class RemoveNameFromArts < ActiveRecord::Migration[5.2]
  def change
    remove_column :arts, :name, :string
  end
end
