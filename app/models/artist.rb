class Artist < ActiveRecord::Base
  has_many :songs, dependent: :destroy

  validates_presence_of :name
end
