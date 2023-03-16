# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    Department.create!(name: "HR")
    Department.create!(name: "Marketing & Sales")
    Department.create!(name: "Business Development Executive")
    Department.create!(name: "Development")
    Department.create!(name: "Finance")

    Employee.all.each do |employee|
      employee.update(password: 'password@123')
    end