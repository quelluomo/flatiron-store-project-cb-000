class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'

  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
  end

  def remove_cart
    self.current_cart_id = nil
    save
  end
end
