class AddProgrammerToPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolios, :programmer, foreign_key: true
  end
end
