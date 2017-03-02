class SchoolClassesController<ApplicationController

  def new
    @school_class=SchoolClass.new
  end

  def create
    @school_class=SchoolClass.create(params[:school_class])
    redirect_to school_class_path(@school_class.id)
  end

  def show
    @school=@school_class=SchoolClass.find(params[:id])
  end

  def edit
    @school_class=set_school_class
  end

  def update
    @school_class=set_school_class
    @school_class.update(class_params(:title, :room_number))
    @school_class.save
    redirect_to school_class_path(@school_class.id)
  end

  private

  def class_params(*args)
    params.require(:school_class).permit(*args)
  end

  def set_school_class
    SchoolClass.find(params[:id])
  end

end
