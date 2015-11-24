class School < ActiveRecord::Base
  has_many :courses, dependent: :destroy
  has_many :users 
end
