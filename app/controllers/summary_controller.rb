class SummaryController < ApplicationController

  def display
    render({ :template => "summary/show.html.erb" })

  end

end
