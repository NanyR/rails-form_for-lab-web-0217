class StudentsController < ApplicationController

  def new
    @student=Student.new
  end

  def create
    @student=Student.create(params[:student])
    redirect_to student_path(@student.id)
  end

  def show
    @student=set_student
  end

  def edit
    @student=set_student
  end

  def update
    @student=set_student
    @student.update(student_params(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student.id)
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end

  def set_student
    Student.find(params[:id])
  end


end
