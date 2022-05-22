# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# ローカルのデータベースをAWS EC2インスタンス内にインポートする
require "csv"
# 1番上に1度だけ記述　

# 以下は各テーブルごとに名前を変えて記述。例えばこれはordersテーブル。
orders_csv = CSV.readlines("db/test_results.csv")
orders_csv.shift
orders_csv.each do |row|
  Order.create(egogram_type: row[1], character: row[2], stregth: row[3], weakness: row[4], people_around_you: row[5], created_at: row[6], updated_at: row[7])
  # idを除くカラム名を記述する
end