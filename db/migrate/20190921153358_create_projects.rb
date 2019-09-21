class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.text :description
      t.text :requirements
      t.decimal :budget

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
