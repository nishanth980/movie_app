class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :reservations

  before_validation :set_role


  def set_role
    self.role = Role.find_by(name: "customer") unless self.role
  end

  def admin?
    role && role.name == 'admin'
  end
end
