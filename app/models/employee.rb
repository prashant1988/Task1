class Employee < ActiveRecord::Base
   attr_accessible  :email_id ,:created_at,:password, :department ,:forwards , :category,:group_head,
                       :requisition_by, :handled_by, :employee_id, :delete_on, :uuid , :status



  validates  :department ,:forwards , :category,:group_head,
            :requisition_by, :handled_by,       :presence=> true

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }
end

