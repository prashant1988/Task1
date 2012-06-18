class Employee < ActiveRecord::Base
   attr_accessible  :email_id ,:created_at,:password, :department ,:forwards , :category,:group_head,
                       :requisition_by, :handled_by, :employee_id, :delete_on, :uuid , :status



  validates  :department ,:forwards , :category,:group_head,
            :requisition_by, :handled_by,       :presence=> true

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }

  def self.dept
    dept1=Employee.select(:department).uniq
    dept_aray=[]
    dept1.each do |d|
      dept_aray.push(d[:department])
    end
    return dept_aray
  end

  def self.catg
    catg1=Employee.select(:category).uniq
    cat_array=[]
    catg1.each do |c|
      cat_array.push(c[:category])
    end
    return cat_array
  end


  #def self.manger
  #  mang1=Employee.select(:forwards||:group_head||:requisition_by||:handled_by).uniq
  #  mang_array=[]
  #  mang1.each do |m|
  #    mang_array.push(d[:forwards||:group_head||:requisition_by||:handled_by])
  #  end
  #  return mang_array
  #end

end

