class AddIsAcceptedToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :is_accepted, :boolean, default: false
  end
end
