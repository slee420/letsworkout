class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :muscle_target
      t.integer :quality
      t.string :location

      t.timestamps
    end
  end
end
