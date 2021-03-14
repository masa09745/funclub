module ScheduleImport
  extend ActiveSupport::Concern

  
  CSV_HEADER = {
    "試合日" => 'match_date',
    "対戦相手" => 'opponent'
  }

  schedules = []

  error = []

  CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row, row_number|

    schedule = Schedule.new

    row_hash = row.to_hash.slice(*CSV_HEADER.keys)
    schedule.attributes = row_hash.transform_keys(&CSV_HEADER.method(:[]))

    if schedule.valid?
      schedules << schedule
    else
      errors.push({:row_num => row_number, :messages => schedule.errors.full_messages})
    end

  return errors if errors.present?

  Schedule.import schedules

  return []
  end
end