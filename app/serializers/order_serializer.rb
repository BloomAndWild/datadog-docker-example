class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :shipping_address, :total_cost,
  			 :order_number, :item, :state
end