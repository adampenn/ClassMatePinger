class UserNotifier < ApplicationMailer
  # Ping a user
  def ping_user(to)
    @to = to
    @users = User.all
    mail( :to => @to.email,
    :subject => 'You\'ve been pinged') 
  end
end
