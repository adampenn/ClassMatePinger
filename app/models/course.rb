class Course < ActiveRecord::Base
  belongs_to :school
  has_many :users
  has_many :users, through: :usercourse
end
