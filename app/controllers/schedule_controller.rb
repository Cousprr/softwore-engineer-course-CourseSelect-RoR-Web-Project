class ScheduleController < ApplicationController
  def index
    @course=current_user.courses if student_logged_in?
    @course.each do |course|
      match=course.course_time.match(/\((\d+-\d+)\)/)
      @time_code=match.split("-").join("")
      @week_code=course.course_time
    end
  end
end
