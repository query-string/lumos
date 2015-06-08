# Establish connection to in-memory SQLite DB
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

# Create the coffee table
ActiveRecord::Migration.verbose = false
ActiveRecord::Migration.create_table :coffees do |t|
  t.string :sort
  t.integer :price
  t.integer :saturation
end

# Create model
class Coffee < ActiveRecord::Base; end
