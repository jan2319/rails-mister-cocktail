class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
