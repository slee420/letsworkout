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
  validates(:date,:muscle_target,:quality,:location,:user_id, { :presence => true })
  validates :quality, numericality: { less_than_or_equal_to: 5 , greater_than_or_equal_to: 1}
  validates :quality, numericality: { only_integer: true}
  #validate :workout_cannot_be_in_the_future

  def workout_cannot_be_in_the_future
    if :date.to_s > Date.today.to_s
      errors.add(:date, "cannot be in the future")
    end
  end
  
  def owner
    return User.where({ :id => self.user_id }).at(0)
  end


  def own_exercises
    return Exercise.where({ :workout_id => self.id })
  end
end
