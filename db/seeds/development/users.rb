users = %w(Hiroharu Fujita Mizuho Nishikawa Nohara Rails Python React Json)
users.each do |user|
  User.create(
    name: user,
    email: user.downcase + "@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
end