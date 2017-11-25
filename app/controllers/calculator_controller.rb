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
  	@units = params[:units]

  	if @units == "miles"
  		@distance = (@distance*1.60934).round(1)
  	end 

  	@time_in_secs = (@hours * 3600) + (@minutes * 60) + @seconds
  	@pace_hour = ((@distance.to_d / @time_in_secs) * 3600).ceil(1)
  	@pace_hour_mph = (@pace_hour * 0.621371).ceil(1)
  	
  	@elevation_metres = ( @incline / 100 ) * @distance * 1000
  	@pace_km_min = (60 / @pace_hour).floor
  	@pace_km_sec = (((60 / @pace_hour) - @pace_km_min ) * 60).floor

  	if @pace_km_sec == 0
  		@pace_km_sec = "00"
  	end

  	@pace_mile_min = (60 / @pace_hour_mph).floor
  	@pace_mile_sec = (((60 / @pace_hour_mph) - @pace_mile_min ) * 60).floor

  	if @pace_mile_sec == 0
  		@pace_mile_sec = "00"
  	end

  end
end
