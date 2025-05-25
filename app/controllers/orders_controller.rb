class OrdersController < ApplicationController
  def index
    @orders = Order.includes(:menu).order(created_at: :desc)
  end

  # def create
  #   order = Order.new(order_params)
    
  #   if order.save
  #     flash[:notice] = "ご注文ありがとうございました！"
  #     redirect_to menus_path
  #   else
  #     flash[:alert] = "注文に失敗しました\n#{order.errors.full_messages.join(', ')}"
  #     redirect_to confirm_menu_path(params[:order][:menu_id])
  #   end
  # end

  def create
    order = Order.new(order_params)

    if order.save
      render json: { success: true, message: "ご注文ありがとうございました！" }
    else
      # バリデーションエラーの詳細をJSONで返す
      render json: { success: false, errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:student_id, :menu_id, :menu_name, :menu_price)
  end
end
