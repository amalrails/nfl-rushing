class CreateRushings < ActiveRecord::Migration[6.0]
  def change
    create_table :rushings do |t|
      t.string :player
      t.string :team
      t.string :pos
      t.integer :att, :default => 0
      t.decimal :att_by_g, :default => 0
      t.decimal :yds, :default => 0
      t.decimal :avg, :default => 0
      t.decimal :yds_by_g, :default => 0
      t.decimal :td, :default => 0
      t.string :lng
      t.decimal :first, :default => 0
      t.float :first_percentage, :default => 0
      t.decimal :twenty_plus, :default => 0
      t.decimal :forty_plus, :default => 0
      t.decimal :fum, :default => 0

      t.timestamps
    end
  end
end
