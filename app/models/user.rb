class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def is_superuser?
  	self.superuser
  end

  def is_admin?
  	self.admin
  end

  def is_client?
  	self.client
  end

  def is_manager?
  	self.manager
  end

  def is_teacher?
    self.teacher
  end

  def has_subscription?
    self.subscription
  end

  def rights
    if self.is_superuser?
      "Superuser"
    elsif self.is_admin?
      "Admin"
    elsif self.is_client?
      "Client"
    elsif self.is_manager?
      "Manager"
    end
  end
end
