# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

b1 = Board.create( :title => "Gear", :description => "discuss gears here") 
b2 = Board.create( :title => "我的裝備", :description => "有什麼寶貝要跟人分享嗎？or 來看看大家有什麼特殊裝備")
b3 = Board.create( :title => "攀岩,旅遊記事", :description => "沒錢,沒時間出國攀岩？來這裡就對了，分享你最精彩的攀岩事！")
b4 = Board.create( :title => "二手裝備", :description => "把家裡不用的東西拿出來,也順便來尋寶一下吧")

p1 = Post.create( :content => "first post")
t1 = Topic.create( :title => "最新的裝備")

b1.topics << t1
t1.posts << p1