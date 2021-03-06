# == Schema Information
#
# Table name: exercises
#
#  id            :integer          not null, primary key
#  description   :string
#  exercise_name :string
#  reps          :integer
#  sets          :integer
#  weight        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  workout_id    :integer
#
class Exercise < ApplicationRecord
  belongs_to :workout
  validates(:exercise_name,:weight,:reps,:sets,:user_id, {:presence => true} )
  validates(:weight,:reps,:sets,:user_id, {:presence => true} )
  validates :weight,:reps,:sets, numericality: { only_integer: true}

end
