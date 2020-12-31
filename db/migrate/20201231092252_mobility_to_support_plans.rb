class MobilityToSupportPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :support_plans, :mobility, :string
  end
end
