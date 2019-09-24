class AddProgrammerAndProjectToOffer < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :programmer, foreign_key: true
    add_reference :offers, :project, foreign_key: true
  end
end
