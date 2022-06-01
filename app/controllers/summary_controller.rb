class SummaryController < ApplicationController

  def display
    @workouts = Workout.all
    @exercises = Exercise.all
    @list_of_workouts = @workouts.order({ :date => :desc })
    render({ :template => "summary/show.html.erb" })

  end

end
