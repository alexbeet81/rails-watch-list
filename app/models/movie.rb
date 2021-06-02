class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true, length: { minimum: 1 }
  validates :overview, presence: true
end
