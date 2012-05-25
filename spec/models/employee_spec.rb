require "spec_helper"

describe Employee do

  before { @emp=Employee.new(:email_id=>'a@yahoo.com',
                             :created_at=> '2012-4-19',
                             :department=> 'HRA',
                             :forwards =>'srinivas',
                             :category =>'client',
                             :group_head=>'vineeth' ,
                             :requisition_by=>'srinivas',
                            :handled_by=>'vineeth') }
      subject { @emp }

              it {should respond_to(:email_id)}
              it {should respond_to(:created_at)}
              it {should respond_to(:department)}
              it {should respond_to(:forwards)}
              it {should respond_to(:category)}
              it {should respond_to(:group_head)}
              it {should respond_to(:requisition_by)}
              it {should respond_to(:handled_by)}

        it { should be_valid}


       describe "when email_id is not present " do
         before {@emp.email_id=" "}
         it {should_not be_valid}

       end

      describe "when forwards not present" do
         before {@emp.forwards=" "}
         it {should_not be_valid}
       end

      describe "when department not present"do
         before{ @emp.department= " "}
         it {should_not be_valid}
        end

        describe "when category not present" do
         before{@emp.category=" " }
         it {should_not be_valid}
        end

      describe "when group_head not present" do
       before{ @emp.group_head=" "}
       it{should_not be_valid }
      end

     describe "when requisition_by not present" do
     before {@emp.requisition_by=" "}
     it {should_not be_valid}
     end


     describe "when group_head is not present" do
    before {@emp.group_head=" "}
     it{should_not be_valid}
     end

    describe "when email_id format is invalid " do
      it "should be invalid" do
        addresses= %w[user@foo,com user_at_foo.org example.user@foo. foobar_baz.com foo@bar+baz.com ]
        addresses.each do |invalid_address|
          @emp.email_id = invalid_address
          @emp.should_not be_valid
        end
      end
      end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @emp.email_id = valid_address
        @emp.should be_valid
      end
    end
  end



      end