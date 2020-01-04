table_names = ["users"]
table_names.each do |table_name|
  filepath = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exists?(filepath)
    puts "Creating... #{table_name}"
    require filepath
  end
end