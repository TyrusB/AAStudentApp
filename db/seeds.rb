User.create(name: "TA1", email: "ta1@em.com", password: "pass")
User.create(name: "TA2", email: "ta2@em.com", password: "pass")


User.create(name: "Student1", email: "st1@em.com", password: "pass", ta_id: 1)
User.create(name: "Student2", email: "st2@em.com", password: "pass", ta_id: 1)
User.create(name: "Student3", email: "st3@em.com", password: "pass", ta_id: 1)


DailyReport.create(week: 1, day: 1, finished_exercises: true, read_solutions: false, read_tomorrows_readings: true,
    rating_of_understanding: 4, easiest_concept: "data seeding", hardest_concept: "ajax", pair_name: "The beard guy",
    pair_rating: 3, pair_comments: "Impressive beard", daily_comments: "I really enjoyed my burrito today", user_id: 3)

