#require 'spec_helper.rb'
require "spec_helper"
 describe EmployeeController do

     def valid_attr
     { :email_id=>'a@yahoo.com',
     :created_at=> '2012-4-19',
     :department=> 'HRA',
     :forwards =>'srinivas',
     :category =>'client',
     :group_head=>'vineeth' ,
      :requisition_by=>'srinivas',
      :handled_by=>'vineeth'

     }
   end
   def invalid_attr
     { :email_id=>' ',
       :created_at=> '2012-4-19',
       :department=> 'HRA',
       :forwards =>'srinivas',
       :category =>'client',
       :group_head=>'vineeth' ,
       :handled_by=>'vineeth' ,

     }
   end




  it "should have index method" do
    emp=Employee.create!valid_attr
    get :index
    assigns(:emps).should eq([emp])
  end





     it "should have show method" do
       emp=Employee.create! valid_attr
       get :show,    :id=>emp.id
       assigns(:emp).should eq(emp )
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
      post:create,    :emp=>invalid_attr
      response.should render_template('new')
    end


 end
