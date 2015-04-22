class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :birth_day, presence: true

  # FriendlyID Gem
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [:first_name,
      [:first_name, :last_name],
      [:last_name, :first_name]
    ]
  end
  # end

end
