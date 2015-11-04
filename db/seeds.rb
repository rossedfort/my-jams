# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Seed
  def initialize
    generate_users
    generate_categories
    generate_artists
    generate_songs
  end

  def generate_categories
    cats = %w(rock reggae metal punk electronic dubstep classical screamo alternative indie)

    cats.each do |cat|
      Category.create(name: cat)
    end
  end

  def generate_users
    me = User.create(
      username: 'rossedfort',
      password: 'hi',
      role: 1
    )
    puts "#{me.username} - #{me.password} ADMIN created!"
    4.times do |i|
      user = User.create(username: Faker::Internet.user_name,
                         password: Faker::Internet.password,
                         role: 0
                        )
      puts "#{user.username} - #{user.password} DEFAULT created!"
    end
  end

  def generate_artists
    10.times do |_i|
      artist = Artist.create(name: Faker::Name.name)
      puts "#{artist.name} created"
    end
  end

  def generate_songs
    50.times do |_i|
      song = Song.create(title: Faker::Lorem.word,
                         artist_id: rand(1..10),
                         user_id: rand(1..5),
                         category_id: rand(1..10)
                        )
      puts "#{song.title} created"
    end
  end
end

Seed.new
