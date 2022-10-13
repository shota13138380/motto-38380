class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items,     dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followee # 自分がフォローしている人
  has_many :follower_user,  through: :followee, source: :follower # 自分をフォローしている人

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :name,     presence: true

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followee_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followee_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end