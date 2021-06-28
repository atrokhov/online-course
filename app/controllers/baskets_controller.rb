class BasketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.basket.orders
    total = 0
    @orders.each { |order| total += order.lesson.price }
    @total = total
  end

  def buy
    orders = current_user.basket.orders
    total = 0
    orders.each { |order| total += order.lesson.price }

    check = Check.create(sum: total, customer: SecureRandom.hex(16))

    orders.each do |order|
      PaidLesson.create(check: check, lesson: order.lesson, user: current_user)
      order.destroy  
    end

    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Lessons was successfully buyed." }
    end
  end
end
