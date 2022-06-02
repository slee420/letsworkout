class WorkoutsController < ApplicationController
  def index
    matching_workouts = Workout.all

    @list_of_workouts = matching_workouts.order({ :created_at => :desc })

    render({ :template => "workouts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_workouts = Workout.where({ :id => the_id })

    @the_workout = matching_workouts.at(0)

    render({ :template => "workouts/show.html.erb" })
  end

  def create
    the_workout = Workout.new
    the_workout.date = params.fetch("query_date")
    the_workout.user_id = params.fetch("user_id")
    the_workout.muscle_target = params.fetch("query_muscle_target")
    the_workout.quality = params.fetch("query_quality")
    the_workout.location = params.fetch("query_location")

    if the_workout.valid?
      the_workout.save
      redirect_to("/workouts", { :notice => "Workout created successfully." })
    else
      redirect_to("/workouts", { :alert => the_workout.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_workout = Workout.where({ :id => the_id }).at(0)

    the_workout.date = params.fetch("query_date")
    the_workout.muscle_target = params.fetch("query_muscle_target")
    the_workout.quality = params.fetch("query_quality")
    the_workout.location = params.fetch("query_location")

    if the_workout.valid?
      the_workout.save
      redirect_to("/workouts/#{the_workout.id}", { :notice => "Workout updated successfully."} )
    else
      redirect_to("/workouts/#{the_workout.id}", { :alert => the_workout.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_workout = Workout.where({ :id => the_id }).at(0)

    the_workout.destroy

    redirect_to("/workouts", { :notice => "Workout deleted successfully."} )
  end
end
