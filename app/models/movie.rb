class Movie < ActiveRecord::Base
  has_many :reviews
  def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end #  shortcut: array of strings

  def self.with_ratings(ratings_list)
    if !ratings_list || ratings_list.empty?
      Movie.all
    else
      Movie.where({ rating: ratings_list.map(&:upcase)})
    end
  end
end