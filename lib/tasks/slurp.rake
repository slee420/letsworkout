namespace :slurp do
  desc "TODO"
  task workout: :environment do

    Workout.destroy_all
    Exercise.destroy_all
    User.destroy_all
    


  #   require "csv"
  #     csv_text = File.read(Rails.root.join("lib", "csvs", "workout.csv"))
  #     csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
  #     csv.each do |row|
  #       #puts row.to_hash
  #         w = Workout.new

  #         w.id = row["id"]
  #         w.user_id = row["user_id"]
  #         w.date = Date.strptime(row["date"], "%d/%m/%Y")
          
  #         w.muscle_target = row["Muscle Target"]
  #         w.quality = row["Quality"]
  #         w.location = row["Location"]
  #         w.save
  #         p w.errors.full_messages
  #         puts "#{w.date}, #{w.muscle_target} saved"
  #       end
        
  #       puts "There are now #{Workout.count} rows in the workout table"
  end

end

namespace :slurp do
  desc "TODO"
  task exercise: :environment do

    Workout.destroy_all
    Exercise.destroy_all
    User.destroy_all

require "csv"
csv_text = File.read(Rails.root.join("lib", "csvs", "exercises.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  #puts row.to_hash
    e = Exercise.new
    e.id = row["id"]
    e.workout_id = row["Workout_id"]
    e.exercise_name = row["Exercise Name"]
    e.weight = row["Weight"]
    e.reps = row["Reps"]
    e.sets = row["Set"]
    e.description = row["Description"]
    e.user_id = row["user_id"]
    e.save
    puts "#{e.exercise_name}, #{e.workout_id} saved"
  end
  
  puts "There are now #{Exercise.count} rows in the exercises table"
end

end
