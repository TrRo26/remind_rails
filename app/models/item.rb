class Item < ApplicationRecord
  belongs_to :list
  has_one :user, {through: :list}

  before_create :keyword_search

  private

  def keyword_search
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
end
