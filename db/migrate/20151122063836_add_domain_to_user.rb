class AddDomainToUser < ActiveRecord::Migration
  def change
    add_column :users, :domain, :integer
  end
end
