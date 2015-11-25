users = User.create(
  [
    { email: 'a@mail.csuchico.edu', name: "Mr. Aardvark", password: "a", password_confirmation: "a"},
    { email: 'b@mail.csuchico.edu', name: "Mr. Bear", password: "b", password_confirmation: "b"},
    { email: 'c@mail.csuchico.edu', name: "Mr. Cat", password: "c", password_confirmation: "c"},
    { email: 'd@mail.csuchico.edu', name: "Mr. Dog", password: "d", password_confirmation: "d"},
    { email: 'e@mail.csuchico.edu', name: "Mr. Elephant", password: "e", password_confirmation: "e"},
    { email: 'f@mail.csuchico.edu', name: "Mr. Fox", password: "f", password_confirmation: "f"},
    { email: 'g@ucdavis.edu', name: "Mr. Gopher", password: "g", password_confirmation: "g"},
    { email: 'h@ucdavis.edu', name: "Mr. Horse", password: "h", password_confirmation: "h"},
    { email: 'i@ucdavis.edu', name: "Mr. Iguana", password: "i", password_confirmation: "i"},
    { email: 'j@ucdavis.edu', name: "Mr. Jackrabbit", password: "j", password_confirmation: "j"},
    { email: 'k@ucdavis.edu', name: "Mr. Kangaroo", password: "k", password_confirmation: "k"},
    { email: 'l@ucdavis.edu', name: "Mr. Llama", password: "l", password_confirmation: "l"},
    { email: 'm@student.butte.eduv', name: "Mr. Mouse", password: "m", password_confirmation: "m"},
    { email: 'n@student.butte.edu', name: "Mr. Numbat", password: "n", password_confirmation: "n"},
    { email: 'o@student.butte.edu', name: "Mr. Opossum", password: "o", password_confirmation: "o"},
    { email: 'p@student.butte.edu', name: "Mr. Peacock", password: "p", password_confirmation: "p"},
    { email: 'q@student.butte.edu', name: "Mr. Quail", password: "q", password_confirmation: "q"},
    { email: 'r@student.butte.edu', name: "Mr. Rabbit", password: "r", password_confirmation: "r"},
    { email: 's@berkeley.edu', name: "Mr. Snake", password: "s", password_confirmation: "s"},
    { email: 't@berkeley.edu', name: "Mr. Tiger", password: "t", password_confirmation: "t"},
    { email: 'u@berkeley.edu', name: "Mr. Urial", password: "u", password_confirmation: "u"},
    { email: 'v@berkeley.edu', name: "Mr. Vulture", password: "v", password_confirmation: "v"},
    { email: 'w@berkeley.edu', name: "Mr. Wombat", password: "w", password_confirmation: "w"},
    { email: 'x@berkeley.edu', name: "Mr. Xerox", password: "x", password_confirmation: "x"},
    { email: 'y@berkeley.edu', name: "Mr. Yak", password: "y", password_confirmation: "y"},
    { email: 'z@berkeley.edu', name: "Mr. Zebra", password: "z", password_confirmation: "z"},
  ]
)

courses = Course.create (
  [
    { name: 'Operating Systems', number: 340, school_id: 1 },
    { name: 'Software Engineering', number: 430, school_id: 1 },
    { name: 'Web Development', number: 465, school_id: 1 },
    { name: 'Artificial Intelegece', number: 580, school_id: 1 },
    { name: 'Religious Studies', number: 332, school_id: 1 },
    { name: 'Computers Impact on Society', number: 301, school_id: 1 },
    { name: 'Operating Systems', number: 340, school_id: 2 },
    { name: 'Software Engineering', number: 430, school_id: 2 },
    { name: 'Web Development', number: 465, school_id: 2 },
    { name: 'Artificial Intelegece', number: 580, school_id: 2 },
    { name: 'Religious Studies', number: 332, school_id: 2 },
    { name: 'Computers Impact on Society', number: 301, school_id: 2 },
    { name: 'Operating Systems', number: 340, school_id: 3 },
    { name: 'Software Engineering', number: 430, school_id: 3 },
    { name: 'Web Development', number: 465, school_id: 3 },
    { name: 'Artificial Intelegece', number: 580, school_id: 3 },
    { name: 'Religious Studies', number: 332, school_id: 3 },
    { name: 'Computers Impact on Society', number: 301, school_id: 3 },
    { name: 'Operating Systems', number: 340, school_id: 4 },
    { name: 'Software Engineering', number: 430, school_id: 4 },
    { name: 'Web Development', number: 465, school_id: 4 },
    { name: 'Artificial Intelegece', number: 580, school_id: 4 },
    { name: 'Religious Studies', number: 332, school_id: 4 },
    { name: 'Computers Impact on Society', number: 301, school_id: 4 }
  ]
)

schools = School.create (
  [
    { name: 'CSU Chico', domain: 'mail.csuchico.edu' },
    { name: 'UC Davis', domain: 'ucdavis.edu' },
    { name: 'Butte College', domain: 'student.butte.edu' },
    { name: 'Berkley', domain: 'berkley.edu' }
  ]
)

courses.each do |course|
  user_ids = Array.new
  size = 1 + rand(1)
  for i in 0..size
    correctDomain = false
    while(!correctDomain)
      user_ids[i] = rand(25) + 1
      schools.each do |school|
        domain = users[user_ids[i]].email.split("@").last
        if school.id == course.school_id && domain == school.domain
          correctDomain = true
        end
      end
    end
  end
  user_ids.uniq!
  user_ids.each do |user_id|
    UserCourse.create(user_id: user_id, course_id: course.id)
  end
end
