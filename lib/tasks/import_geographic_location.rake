require "csv"
namespace :master_data do
  desc "Import geographical location master data"
  task import_geographic_location: :environment do
    ActiveRecord::Base.transaction do
      %w(Province District).each{|model| import_location_data "#{model}".constantize}
    end
  end

  def import_location_data model
    model.destroy_all
    CSV.foreach(Rails.root.join("db/master_data", "#{model.table_name}.csv"), headers: true) do |row|
      instance = model.create row.to_h
      if instance.errors.any?
        puts "row #{$.} => #{instance.errors.full_messages.join ','}"
        fail ActiveRecord::Rollback
      end
    end
  end
end
