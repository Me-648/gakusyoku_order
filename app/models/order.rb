# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :menu

  # student_id のバリデーション
  validates :student_id, presence: { message: "は必須です" },
                         numericality: { only_integer: true, message: "は半角数字で入力してください" },
                         length: { is: 4, message: "は4桁で入力してください" }

  # menu_name のバリデーション
  validates :menu_name, presence: { message: "メニュー名が不明です" } # Null制約があるので念のため

  # menu_price のバリデーション
  validates :menu_price, presence: { message: "価格が不明です" },
                         numericality: { only_integer: true, greater_than: 0, message: "価格は0より大きい整数で入力してください" }
end