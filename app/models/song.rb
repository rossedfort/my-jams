class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  belongs_to :category
  validates_presence_of :title,
                        :artist_id
end
