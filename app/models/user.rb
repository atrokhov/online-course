class User < ApplicationRecord
  has_one :basket
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :client, :manager, :superuser, :teacher]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def has_subscription?
    self.subscription
  end

  def rights
    if self.superuser?
      "Superuser"
    elsif self.admin?
      "Admin"
    elsif self.client?
      "Client"
    elsif self.manager?
      "Manager"
    elsif self.teacher?
      "Teacher"
    end
  end
end
