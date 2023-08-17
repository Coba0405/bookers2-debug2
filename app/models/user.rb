class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  
  has_many :books, dependent: :destroy
# ↑1:NのNが指定されていなかったからNoMethodErrorが発生した
# has_many :booksでuserモデルにNのbooksが指定された。このbooksは@booksにも効果が及ぶ…？

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
