User.create!([{name:  "Example User",
             email: "example@railstutorial.org",
             school: "Example Elementary",
             password:              "foobearish",
             password_confirmation: "foobearish",
             admin: true},
             {name: "Example User Two",
              email: "exampletwo@railstutorial.org",
              school: "Example Elementary",
              password: "bearfooish",
              password_confirmation: "bearfooish",
              admin: false}])

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  school = "Example Elementary"
  password = "password"
  User.create!(name:  name,
               email: email,
               school: school,
               password:              password,
               password_confirmation: password)
end