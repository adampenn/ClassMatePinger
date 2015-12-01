class AddSentMailToUser < ActiveRecord::Migration
  def change
    add_column :users, :sentMail, :boolean
  end
end
