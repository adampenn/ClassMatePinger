class User < ActiveRecord::Base
  has_many :courses
  has_many :user_courses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def domain
    self.email.split("@").last
  end
end
