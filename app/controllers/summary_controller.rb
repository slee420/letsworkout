class SummaryController < ApplicationController

  def display
    @workouts = Workout.where({ :user_id => session.fetch(:user_id)})
    @exercises = Exercise.where({ :user_id => session.fetch(:user_id)})
    #workout_title = "workout.date workout.muscle_target"

    #the_id = params.fetch("path_id")
    #@exercises = Exercise.where({ :workout_id => the_id })

    

    @list_of_workouts = @workouts.order({ :date => :desc })
    render({ :template => "summary/show.html.erb" })

  end

end
