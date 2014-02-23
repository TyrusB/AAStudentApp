buck = User.create(name: "Buck", email: "ta1@em.com", password: "pass", :is_admin => true)
User.create(name: "TA2", email: "ta2@em.com", password: "pass", :is_admin => true)


minh = User.create(name: "Minh", email: "st1@em.com", password: "pass", ta_id: 1)
User.create(name: "Student2", email: "st2@em.com", password: "pass", ta_id: 1)
User.create(name: "Student3", email: "st3@em.com", password: "pass", ta_id: 1)


DailyReport.create!(week: 1, day: 1, finished_exercises: true, read_tomorrows_readings: true,
    rating_of_understanding: 4, read_solutions: false, easiest_concept: "data seeding", hardest_concept: "ajax", pair_name: "The beard guy",
    pair_rating: 3, pair_comments: "Impressive beard", daily_comments: "I really enjoyed my burrito today", user_id: minh.id)

assessment = Assessment.create(:name => "Rails assessment", :cohort_id => 1, :maximum_mark => 10)
submission = Submission.create(:assessment_id => assessment.id, :user_id => minh.id)
userfile = SourceFile.create(:file_path => "app/models/user.rb", :body => "class User
  has_many :cats
end", :submission_id => submission.id)
catfile = SourceFile.create(:file_path => "app/models/cat.rb", :body => "class Cat
  belongs_to :user
end", :submission_id => submission.id)

Annotation.create!(:start_pos => 0, :end_pos => 5, :source_file_id => userfile.id,
                      :user_id => buck.id, :body => "that's classist")