class RemoveNameFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :name, :string
  end
end
