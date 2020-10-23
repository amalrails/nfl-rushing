class Rushing < ApplicationRecord

  validates_presence_of :player, :team

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |rushing|
        csv << rushing.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      rushing_hash = row.to_hash
      rushing = find_or_create_by!(player: rushing_hash['player'], team: rushing_hash['team'])
      rushing.update_attributes(player: rushing_hash['player'], team: rushing_hash['team'],
                                pos: rushing_hash['pos'], att: rushing_hash['att'],
                                att_by_g: rushing_hash['att_by_g'], yds: rushing_hash['yds'],
                                avg: rushing_hash['avg'], yds_by_g: rushing_hash['yds_by_g'],
                                td: rushing_hash['td'], lng: rushing_hash['Lng'],
                                first: rushing_hash['1st'], first_percentage: rushing_hash['first_percentage%'],
                                twenty_plus: rushing_hash['twenty_plus'], forty_plus: rushing_hash['forty_plus'],
                                fum: rushing_hash['fum'])
    end
    File.delete(file)
  end
end
