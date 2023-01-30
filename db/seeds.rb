# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# admin
Admin.create!(:email => 'goto@admin.com', :password => 'goto0510')

# genre
Genre.create!(:name => "アクション")
Genre.create!(:name => "アニメ")
Genre.create!(:name => "ドラマ")
Genre.create!(:name => "恋愛")
Genre.create!(:name => "ホラー")
Genre.create!(:name => "戦争")
Genre.create!(:name => "ミュージカル")
Genre.create!(:name => "スポーツ")
Genre.create!(:name => "SF")
Genre.create!(:name => "コメディ")
Genre.create!(:name => "アドベンチャー・冒険")
Genre.create!(:name => "バイオレンス")
Genre.create!(:name => "サスペンス")
Genre.create!(:name => "ミステリー")
Genre.create!(:name => "パニック")
Genre.create!(:name => "ファンタジー")
Genre.create!(:name => "ドキュメンタリー")
