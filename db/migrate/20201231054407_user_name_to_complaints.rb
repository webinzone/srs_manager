class UserNameToComplaints < ActiveRecord::Migration[5.2]
  def change
	add_column :complaints, :user_name, :string
  end
end
