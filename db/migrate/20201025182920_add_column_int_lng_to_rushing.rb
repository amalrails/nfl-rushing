class AddColumnIntLngToRushing < ActiveRecord::Migration[6.0]
  def up
    add_column(:rushings, :int_lng, :integer, :default => 0)
    Rushing.all.each do |rushing|
      rushing.update_attribute(:int_lng, rushing.lng.tr('^0-9-', '').to_i)
    end
  end

  def down
    remove_column(:rushings, :int_lng)
  end
end
