class AddUserIdToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :user_id, :integer
  end
end
