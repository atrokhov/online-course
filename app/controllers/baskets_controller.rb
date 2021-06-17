class BasketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.basket.orders
    total = 0
    @orders.each { |order| total += order.lesson.price }
    @total = total
  end
end
