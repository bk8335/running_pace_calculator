class CalculatorController < ApplicationController
  def pace_form
  end

  def calculate_pace
  end

  def results
  	# debugger
  	@distance = params[:distance].to_d
  	@hours = params[:hours].to_i
  	@minutes = params[:minutes].to_i
  	@seconds = params[:seconds].to_i
  	@incline = params[:incline].to_d

  	@time_in_secs = (@hours * 3600) + (@minutes * 60) + @seconds
  	@pace_hour = ((@distance.to_d / @time_in_secs) * 3600).ceil(1)
  	@elevation = ( @incline / 100 ) * @distance * 1000
  	@pace_km_min = (60 / @pace_hour).floor
  	@pace_km_sec = (((60 / @pace_hour) - @pace_km_min ) * 60).floor
  	@pace_round = ((@distance.to_d / @time_in_secs) * 3600).round(3)
  end
end
