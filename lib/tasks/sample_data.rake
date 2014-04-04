namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end


def make_users

  99.times do |n|
    username  = "user#{n+1}"
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(username:     username,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end
def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end