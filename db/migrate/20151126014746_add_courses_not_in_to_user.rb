class AddCoursesNotInToUser < ActiveRecord::Migration
  def change
    add_column :users, :coursesNotIn, :text
  end
end
