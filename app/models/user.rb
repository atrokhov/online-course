class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_superuser?
  	!Superuser.where(user: self).blank? ? true : false
  end

  def is_admin?
  	!Admin.where(user: self).blank? ? true : false
  end

  def is_client?
  	!Client.where(user: self).blank? ? true : false
  end

  def is_manager?
  	!Manager.where(user: self).blank? ? true : false
  end

  def has_subscription?
    client = Client.find_by(user: self)
    client.subscription
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
