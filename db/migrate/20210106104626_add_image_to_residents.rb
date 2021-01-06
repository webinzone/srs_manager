class AddImageToResidents < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :image, :text
  end
end
