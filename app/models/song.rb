class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validate :future?


  def released?
    released == true
  end

  def future?
    if release_year
      if release_year > Date.today.year
        errors.add(:release_year, "put a year before this year")
      end
    end
  end

end
