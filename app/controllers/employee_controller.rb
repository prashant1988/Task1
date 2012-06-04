class EmployeeController < ApplicationController
  before_filter :authenticate_user!

  def index

    @emps= Employee.paginate(:page => params[:page], :per_page=>5).find(:all, :conditions => ["status='0' OR status='1' ", status])
   #@emps=Employee.all
  end

  def new
    @emp= Employee.new
  end


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
  
  def search
    @emp=Employee.find(:all, :conditions=>['email_id LIKE?  OR status LIKE? OR forwards LIKE?  OR group_head LIKE? OR department LIKE? OR category  LIKE?
                                                OR requisition_by LIKE? OR forwards LIKE? ',
                                        "#{params[:department]}","#{params[:department]}","#{params[:department]}",
                                        "#{params[:department]}","#{params[:department]}","#{params[:department]}","#{params[:department]}","#{params[:department]}"])

     #@emp=Employee.find(:all,:conditions=>['id =?', "#{params[:id]}"])          #use if we wants to search on basis or id because id is integer left are string or charter.

  end



  def show
   @emp=Employee.find(params[:id])
  end

  def edit
    @emp=Employee.find(params[:id])
  end

  def update
    @emp=Employee.find(params[:id])
    if @emp.update_attributes(params[:employee])
      redirect_to :action=>'index'
    else
      render 'edit'
    end
  end

  def destroy
    @emp=Employee.find(params[:id])
    @emp.update_attribute(:status,'2')
    redirect_to :action=>'index'
    end

end
