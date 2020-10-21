class CreateRushings < ActiveRecord::Migration[6.0]
  def change
    create_table :rushings do |t|
      t.string :player
      t.string :team
      t.string :pos
      t.integer :att
      t.decimal :att_by_g
      t.decimal :yds
      t.decimal :avg
      t.decimal :yds_by_g
      t.decimal :td
      t.string :lng
      t.decimal :1st
      t.float :1st_percentage
      t.decimal :20plus
      t.decimal :40plus
      t.decimal :fum

      t.timestamps
    end
  end
end
