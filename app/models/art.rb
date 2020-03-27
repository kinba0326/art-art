class Art < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Art.all unless search
    Art.where('text LIKE(?)', "%#{search}%")
  end
end
