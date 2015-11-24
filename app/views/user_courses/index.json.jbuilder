json.array!(@user_courses) do |user_course|
  json.extract! user_course, :id, :user_id, :course_id
  json.url user_course_url(user_course, format: :json)
end
