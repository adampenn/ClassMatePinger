class User < ActiveRecord::Base
  has_many :courses
  has_many :user_courses, dependent: :destroy
  serialize :coursesIn, Array
  serialize :coursesNotIn, Array
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  def domain
    self.email.split("@").last
  end
end
