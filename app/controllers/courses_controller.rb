class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /co
  # GET /courses.json
  def index
    @courses = Course.all
    @user_courses = UserCourse.all
    @users = coursesNotIn
    @schools = School.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @courses = Course.all
    @user_courses = UserCourse.all
    @users = coursesNotIn
    @user_course = UserCourse.new
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end
  
  def email_user(to, course)
    sendmail( :to => to.email,
    :subject => 'You\'ve been pinged') 
  end
  helper_method :email_user

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to schools_url(@course.school_id), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to schools_url(@course.school_id), notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :number, :school_id)
    end

    def coursesIn
      users = User.all
      userCourses = UserCourse.all
      courses = Course.all
      userCourses.each do |userCourse|
        courses.each do |course|
          users.each do |user|
            if course.id == userCourse.course_id && user.id == userCourse.user_id
              user.coursesIn.push(course)
            end
          end
        end
      end
      return users
    end
    def coursesNotIn
      courses = Course.all
      users = coursesIn
      schools = School.all
      users.each do |user|
        schools.each do |school|
          if user.domain == school.domain
            courses.each do |course|
              if course.school_id == school.id && !user.coursesIn.include?(course)
                user.coursesNotIn.push(course)
              end
            end
          end
        end
      end
      return users
    end
end
