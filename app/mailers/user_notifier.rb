class UserNotifier < ApplicationMailer
  default :from => 'classmatepinger@gmail.com'

  # Ping a user
  def ping_user
    @to = to
    @users = User.all
    @users.each do |user|
      if current_user.id == user.id
        @from = user
      end
    end
    mail( :to => @to.email,
    :subject => 'You\'ve been pinged') 
  end
end
