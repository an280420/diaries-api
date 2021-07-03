# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Diary.destroy_all

time_expiration = Time.now + 600

diaries = [
  diary1 = Diary.create(title: "Дневник1", kind: "public"),
  diary2 = Diary.create(title: "Дневник2", kind: "private"),
  diary3 = Diary.create(title: "Дневник3", kind: "private", expiration: time_expiration),
  diary4 = Diary.create(title: "Дневник4", kind: "private", expiration: time_expiration)
]

diaries.each do |diary|
  Note.create(diary_id: diary.id, text: 'Первая запись')
  Note.create(diary_id: diary.id, text: 'Вторая запись')
  Note.create(diary_id: diary.id, text: 'Третья запись')
end
