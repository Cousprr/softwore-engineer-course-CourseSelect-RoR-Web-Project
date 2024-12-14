class CreditController < ApplicationController
  def index
    @courses=current_user.courses if student_logged_in?
    @grades=current_user.grades

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
    @courses.zip(@grades).each do |course,grade|
      credit = course.credit[3,3].to_i
      my_grade = grade.grade.to_i

      @credit_all+=credit
      @credit_pub+=credit if course.course_type == '公共选修课'
      @credit_fpub+=credit if course.course_type == '一级学科普及课'
      @credit_fhea+=credit if course.course_type == '一级学科核心课'
      @credit_prpub+=credit if course.course_type == '专业普及课'
      @credit_prhea+=credit if course.course_type == '专业核心课'
      @credit_prdis+=credit if course.course_type == '专业研讨课'
      @credit_get_all+=credit if my_grade>=60
      @credit_get_pub+=credit if course.course_type == '公共选修课' and my_grade>=60
      @credit_get_fpub+=credit if course.course_type == '一级学科普及课'and my_grade>=60
      @credit_get_fhea+=credit if course.course_type == '一级学科核心课'and my_grade>=60
      @credit_get_prpub+=credit if course.course_type == '专业普及课'and my_grade>=60
      @credit_get_prhea+=credit if course.course_type == '专业核心课'and my_grade>=60
      @credit_get_prdis+=credit if course.course_type == '专业研讨课'and my_grade>=60
    end
  end
end
