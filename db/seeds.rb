case Rails.env
when "development"
  # Create some users
  10.times do |i|
    User.create!(
      email: "user-#{i + 1}@example.com",
      password: "password123",
      password_confirmation: "password123",
      name: Faker::Name.name
    )
    # puts "Created user: #{user.email}"
  end

  # Create some posts
  # User.all.each do |user|
  #   3.times do
  #     user.posts.create!(
  #       content: Faker::Lorem.paragraph
  #     )
  #   end
  # end
end
