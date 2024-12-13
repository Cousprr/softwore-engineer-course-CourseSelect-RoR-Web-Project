class CreditController < ApplicationController
  def index
    @course=current_user.courses if student_logged_in?
    @credit_pub=0
    @credit_fpub=0
    @credit_fhea=0
    @credit_prpub=0
    @credit_prhea=0
    @credit_prdis=0
    @credit_all=0
    @credit_get_pub=0
    @credit_get_fpub=0
    @credit_get_fhea=0
    @credit_get_prpub=0
    @credit_get_prhea=0
    @credit_get_prdis=0
    @credit_get_all=0
    @course.each do |course|
      credit = course.credit[3,3].to_i
      @grade = current_user.grades.find_by_id(:course_id)
      grade = @grade.grade.to_i
      @credit_all+=grade
      @credit_pub+=credit if course.course_type == '公共选修课'
      @credit_fpub+=credit if course.course_type == '一级学科普及课'
      @credit_fhea+=credit if course.course_type == '一级学科核心课'
      @credit_prpub+=credit if course.course_type == '专业普及课'
      @credit_prhea+=credit if course.course_type == '专业核心课'
      @credit_prdis+=credit if course.course_type == '专业研讨课'
      @credit_get_all+=credit if grade>=60
      @credit_get_pub+=credit if course.course_type == '公共选修课' and grade>=60
      @credit_get_fpub+=credit if course.course_type == '一级学科普及课'and grade>=60
      @credit_get_fhea+=credit if course.course_type == '一级学科核心课'and grade>=60
      @credit_get_prpub+=credit if course.course_type == '专业普及课'and grade>=60
      @credit_get_prhea+=credit if course.course_type == '专业核心课'and grade>=60
      @credit_get_prdis+=credit if course.course_type == '专业研讨课'and grade>=60
    end
  end
end
