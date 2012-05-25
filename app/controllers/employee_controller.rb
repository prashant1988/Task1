class EmployeeController < ApplicationController

  def index
    @emps= Employee.all
  end

  def new
    @emp= Employee.new

  end

    $status
  def create
      @emp=Employee.new(params[:employee])
         u=UUID.new
       @emp.uuid=u.generate[1,7]
    if @emp.save


      redirect_to  employee_index_path

    else
      flash.now[:error] = "Could not save data"
      render :action => "new"
    end

  end


  def show
    @emp=Employee.find(params[:id])
  end





end
