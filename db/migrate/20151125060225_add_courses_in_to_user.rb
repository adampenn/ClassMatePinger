class AddCoursesInToUser < ActiveRecord::Migration
  def change
    add_column :users, :coursesIn, :text
  end
end
