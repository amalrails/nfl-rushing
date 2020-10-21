class AddIndexToRushings < ActiveRecord::Migration[6.0]
  def change
    add_index :rushings, :player
    add_index :rushings, :team
    add_index :rushings, :yds
    add_index :rushings, :td
    add_index :rushings, :lng
  end
end
