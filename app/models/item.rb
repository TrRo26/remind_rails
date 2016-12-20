class Item < ApplicationRecord
  belongs_to :list
  has_one :user, {through: :list}

  before_create :grocery_search

  private

  def grocery_search
    keywords = Keyword.all
    keywords.each do |keyword|
      if keyword.item.downcase == self.name.downcase
        self.keyword = keyword.name
        break
      end
    end

    if self.keyword == nil
      self.keyword = self.name
    end
  end

#   def video_game_search
#    video_games = JSON.parse(open("https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=name&limit=10&offset=0&order=release_dates.date%3Adesc&search=#{self.name}",
#     "X-Mashape-Key" => "#{ENV["VIDEO_GAMES"]}").read)
#     if video_games[0] != nil
#       if video_games[0]["name"].include?(self.name)
#         self.keyword = "Video Game"
#       end
#     elsif self.keyword == nil
#       self.keyword = self.name
#     end
#   end
end
