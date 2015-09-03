class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z_-]+$/,
                             message: "Must be formatted correctly."
                           }


  has_many :statuses, dependent: :destroy
  accepts_nested_attributes_for :statuses, allow_destroy: true

  def full_name
    first_name + " " + last_name
  end
end
