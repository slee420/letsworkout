# == Schema Information
#
# Table name: workouts
#
#  id            :integer          not null, primary key
#  date          :date
#  location      :string
#  muscle_target :string
#  quality       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class Workout < ApplicationRecord
  #belongs_to :workout
  has_many :exercises
  validates(:date,:muscle_target,:quality,:location , { :presence => true })
  
  def owner
    return User.where({ :id => self.user_id }).at(0)
  end


  def own_exercises
    return Exercise.where({ :workout_id => self.id })
  end
end
