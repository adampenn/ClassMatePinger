class AddDomainToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :domain, :string
  end
end
