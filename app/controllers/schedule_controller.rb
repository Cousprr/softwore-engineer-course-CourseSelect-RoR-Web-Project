class ScheduleController < ApplicationController
  def index
    @course=current_user.courses if student_logged_in?
    @time_code=[]
    @week_code=[]
    @course.each do |course|
      @time_code<<course.course_time[3,1].to_i
      @week_code<<course.course_time[0,2]
    end
  end
end
