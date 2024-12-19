class CoursesController < ApplicationController

  before_action :student_logged_in, only: [:select, :quit, :list]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update, :open, :close]#add open by qiao
  before_action :logged_in, only: :index
  before_action :set_courses_all, only: [:list, :search]

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(course_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def open
    @course=Course.find_by_id(params[:id])
    @course.update_attributes(open: true)
    redirect_to courses_path, flash: {:success => "已经成功开启该课程:#{ @course.name}"}
  end

  def close
    @course=Course.find_by_id(params[:id])
    @course.update_attributes(open: false)
    redirect_to courses_path, flash: {:success => "已经成功关闭该课程:#{ @course.name}"}
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  #-------------------------for students----------------------

  def list
    #-------QiaoCode--------
    @courses = Course.where(:open=>true).paginate(page: params[:page], per_page: 4)
    @course = @courses-current_user.courses
    tmp=[]
    @course.each do |course|
      if course.open==true
        tmp<<course
      end
    end
    @course=tmp
  end

  def compare(sel_course)
    type=0
    current_user.courses.each do |my_course|
      if my_course.name == sel_course.name
        type=1
        break
      elsif my_course.course_time == sel_course.course_time
        type=2
        @conflict=my_course
        break
      end
    end
    type
  end

  def select
    @course=Course.find_by_id(params[:id])
    type=compare(@course)
    if type==1
      flash={:warning => "你过去已经选择了课程：#{@course.name}"}
    elsif @course.limit_num.to_i < @course.student_num.to_i
      flash={:warning => "课程#{@course.name}选课人数已满"}
    elsif type==2
      flash={:warning => "课程 #{@course.name} 和课程 #{@conflict.name} 的上课时间冲突"}
    else
      current_user.courses<<@course
      flash={:success => "成功选择课程: #{@course.name}"}
    end
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def set_courses_all
    @courses_all=Course.where(:open=>true)
  end

  def search
    check_time=params[:check_time]=="1"
    check_choice=params[:check_choice]=="1"
    check_name=params[:check_name]=="1"
    conditions = []
    values = []

    if check_time
      conditions << "course_time = ?"
      values << params[:my_time_day] + params[:my_time_hour]
    end
    if check_choice
      conditions << "course_type = ?"
      values << params[:my_classchoice]
    end
    if check_name
      conditions << "name = ?"
      values << params[:my_classname]
    end

    conditions << "open = ?"
    values << true

    @courses = Course.where(conditions.join(" AND "), *values).paginate(page: params[:page], per_page: 4)
    @courses = [] if @courses.to_a.empty?
    render 'list'
  end


  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses.paginate(page: params[:page], per_page: 4) if teacher_logged_in?
    @course=current_user.courses.paginate(page: params[:page], per_page: 4) if student_logged_in?
  end


  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week)
  end


end
