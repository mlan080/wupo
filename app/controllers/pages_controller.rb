class PagesController < ApplicationController
  def about
  end
  
  def calendar
    start_of_month = Time.now.beginning_of_month
    end_of_month = Time.now.end_of_month

    @consultations = Consultation.where(
      "start_time >= ? AND end_time <= ?", start_of_month, end_of_month
    )
  end
end
