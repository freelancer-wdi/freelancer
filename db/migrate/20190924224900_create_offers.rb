class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :description
      t.string :time
      t.decimal :budget

      t.timestamps
    end
  end
end
