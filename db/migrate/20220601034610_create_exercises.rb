class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.string :exercise_name
      t.integer :weight
      t.integer :reps
      t.integer :sets
      t.string :description

      t.timestamps
    end
  end
end
