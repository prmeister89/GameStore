require 'rest-client'
require 'json'
require 'nokogiri'

class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :original_release_date, presence: true
  validates :original_game_rating, presence: true
  validates :platforms, presence: true
  validates :price, presence: true
  #
  # @library = RestClient.get("https://www.giantbomb.com/api/games/?api_key=e557578a11e07ac8ba68c4823e186bb115e1452a")
  #
  # def self.api_fetch
  #   byebug
  #   puts nil
  #   JSON.parse(@library).response
  # end

  def self.tryagain
    doc = Nokogiri::XML(File.open("games.xml"))
    g = doc.at_xpath("response/results")
    r = g.children
    games = r.map do |name|
      #game name
      name.children.to_a[14].text
      #game description
      binding.pry
      Nokogiri::HTML(name.children.to_a[5].text).css('p')[0].text
      #game original_release_date
      name.children.to_a[17].text[0..9]
      #game original_game_rating
      name.children.to_a[16].text.split.last
      #array of game platforms
      ar = name.children.to_a[18].children.children.children.select do |x|
        x.text.length>3 && !(x.text.start_with?("http"))
        end.map do |y|
          y.text
        end
    end
    puts games
  end

end

  #
  # page = "https://www.giantbomb.com/api/games/?api_key=e557578a11e07ac8ba68c4823e186bb115e1452a"
  #
  # @page_getter = Nokogiri::HTML(open(page))
  #
  # def self.gitit
  #   byebug
  #   puts nil
  #   @page_getter.css('game').text
  #
  #   @page_getter.css('tr')[3].text.split("\r\n").select {|x| x.length>0 && x!=" " }
  #   sta = @get_real.css('div')[0].text.split(" ")
  #
  #   puts message
  #
  # end
