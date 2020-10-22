class Rushing < ApplicationRecord

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |product|
        csv << product.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      rushing_hash = row.to_hash
      rushing = find_or_create_by!(name: rushing_hash['Player'], team: rushing_hash['Team'])
      rushing.update_attributes(rushing_hash)
    end
  end

  # def self.to_csv(options = {})
  #     CSV.generate(options) do |csv|
  #       csv << column_names
  #       all.each do |employee|
  #         csv << employee.attributes.values_at(*column_names)
  #       end
  #     end
  #   end

  # def import(file)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     rushing_hash = row.to_hash
  #     rushing = find_or_create_by!(player: rushing_hash['Player'], team: product_hash['Team'])
  #     rushing.update_attributes(player: rushing_hash['Player'], team: rushing_hash['Team'],
  #                                pos: rushing_hash['Pos'], att: rushing_hash['Att'],
  #                                att_by_g: rushing_hash['Att/G'], yds: rushing_hash['Yds'],
  #                                avg: rushing_hash['Avg'], yds_by_g: rushing_hash['Yds/G'],
  #                                td: rushing_hash['TD'], lng: rushing_hash['Lng'],
  #                                first: rushing_hash['1st'], first_percentage: rushing_hash['1st%'],
  #                                twenty_plus: rushing_hash['20+'], forty_plus: rushing_hash['40+'],
  #                                fum: rushing_hash['FUM'])
  #   end
  # end
end
