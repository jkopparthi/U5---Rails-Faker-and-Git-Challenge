require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join("db/products.csv")
csv_data = File.read(csv_file)
rows = CSV.parse(csv_data, headers: true)
# If the CSV was created by Excel on Windows, use this line instead:
# rows = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

rows.each do |row|
  # If your CSV headers are named differently, change the names in quotes.
  category = Category.find_or_create_by(name: row["category"])

  category.products.create!(
    title:          row["name"] || row["title"],
    description:    row["description"],
    price:          row["price"],
    stock_quantity: row["stock quantity"] || row["stock_quantity"]
  )
end

puts "Created #{Category.count} categories and #{Product.count} products"