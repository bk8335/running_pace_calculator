class CalculatorController < ApplicationController
  def pace_form
  end

  def calculate_pace
  
  end

  def results
  	# debugger
  	@distance = params[:distance].to_i
  	@hours = params[:hours].to_i
  	@minutes = params[:minutes].to_i
  	@seconds = params[:seconds].to_i
  	@time_in_secs = (@hours * 3600) + (@minutes * 60) + @seconds

  	@pace = ((@distance.to_d / @time_in_secs) * 3600).ceil(1)
  	@pace_round = ((@distance.to_d / @time_in_secs) * 3600).round(3)
  end
end
