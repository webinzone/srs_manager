class AddSpecialItemsToResidentsAgreements < ActiveRecord::Migration[5.2]
  def change
    add_column :residents_agreements, :special_items, :string
  end
end
