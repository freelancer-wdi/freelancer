class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :image
      t.boolean :is_employed
      t.text :about
      t.string :cv

      t.timestamps
    end
  end
end
