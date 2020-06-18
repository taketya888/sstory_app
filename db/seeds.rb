User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(3)
50.times do
    title = Faker::Book.title
    start_text = Faker::Lorem.sentence(5)
    consent_text = Faker::Lorem.sentence(5)
    terning_text = Faker::Lorem.sentence(5)
    finish_text = Faker::Lorem.sentence(5)
    users.each { |user| user.stories.create!(title: title,
                                             start_text: start_text,
                                             consent_text: consent_text,
                                             terning_text: terning_text,
                                             finish_text: finish_text, ) }
end