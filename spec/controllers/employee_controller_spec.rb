
require "spec_helper"
 describe EmployeeController do
   include Devise::TestHelpers

   before (:each) do
     @user = User.create(:email=>'p@gmial.com',:password=>'123456')
     sign_in @user
   end

     def valid_attr
     { :email_id=>"a@yahoo.com",
     :created_at=> "2012-4-19",
     :department=> "HRA",
     :forwards =>"srinivas",
     :category =>"client",
     :group_head=>"vineeth" ,
     :requisition_by=>"srinivas",
     :handled_by=>"vineeth",
     :status => "0"

     }
   end
   def invalid_attr
     { :email_id=> "",
       :created_at=> '2012-4-19',
       :department=> ' ',
       :forwards =>'srinivas',
       :category =>'client',
       :group_head=>'vineeth' ,
       :handled_by=>'vineeth'
     }
   end




  it "should have index method" do
    emp=Employee.create! valid_attr
    get :index
    assigns(:emps).should eq([emp] )
  end





     it "should have show method" do

       emp=Employee.create! valid_attr
       get :show,    :id=>emp.id
      assigns(:emp).should eq(emp )
      # response.should render_template('show')
     end


    it "should have valid search method" do
      emp=Employee.create! valid_attr
       get :search ,:department=>"a@yahoo.com"
      response.should render_template('search')
    end

    it "should have a edit method" do
      emp=Employee.create! valid_attr
      get:edit, :id=>emp.id
      response.should render_template('edit')
    end

     it "should have a valid update method" do
       emp=Employee.create! valid_attr
       put :update, :id=>emp.id, :employee=>valid_attr
       response.should redirect_to(employee_index_path)
     end

    it "should have a invalid update" do
      emp=Employee.create! valid_attr

      put :update, :id=>emp.id, :employee=>invalid_attr
      response.should render_template('edit')

    end


     it "should have new method" do
       get :new
       response.should render_template('new')
     end

     it "should have valid create  method" do
       post:create,   :employee =>valid_attr
       response.should redirect_to(employee_index_path)
     end

    it "should have invalid create method" do
      post:create,    :employee=>invalid_attr
      response.should render_template('new')
    end

    it "should have a destroy method"  do
     emp=Employee.create!valid_attr
     delete :destroy, :id=>emp.id, :status=>'2'
     response.should redirect_to(employee_index_path)

   end


 end
