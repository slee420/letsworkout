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
#
class Workout < ApplicationRecord
  belongs_to :workout
  has_many :exercises
  validates(:date,:muscle_target,:quality,:location , { :presence => true })
  
end
