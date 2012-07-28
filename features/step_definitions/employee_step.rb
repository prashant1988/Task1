#Given /^I have employee_lists column (.+)$/ do   |columns|
#  columns.split(', ').each do |column|
#    Employee.create!(:title => column)
#  end
#end


Given /^I have no employees$/ do
  Employee.delete_all
end

Then /^I should have ([0-9]) articles$/ do |count|
  Employee.count.should == count.to_i
end


