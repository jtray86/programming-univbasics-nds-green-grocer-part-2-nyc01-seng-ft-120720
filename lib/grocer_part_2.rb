require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  index = 0 
  coupons.each do |coupon_count| 
    cart_item = find_item_by_name_in_collection(coupon_count[:item],cart)
    coupon_item = "#{coupon_count[:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(coupon_item,cart)
    if cart_item && cart_item[:count] >= coupon_count[:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:num] += coupon_count[:num]
        cart_item[:count] -= coupon_count[:num]
        
      else
      cart_item_with_coupon={
      :item => coupon_item,
      :price => coupon_count[:cost]/coupon_count[:num],
      :clearance => cart_item[:clearance],
      :count => coupon_count[:num]
      }
      cart<< cart_item_with_coupon
      cart_item[:count] -= coupon_count[:num]
      end
    end  
  index += 1  
  end
  cart
end

def apply_clearance(cart)
  index = 0 
  while index < cart.length
 
    if cart[index][:clearance] 
      
      cart[index][:price] = (cart[index][:price] - (cart[index][:price] * 0.20)).round(2) 
      
    end 
    index +=1
  end    
  cart

end

def checkout(cart, coupons)
  index = 0
  new_consolidate_cart = consolidate_cart(cart) 
  new_cart_with_coupons = apply_coupons(new_consolidate_cart, cart)
  new_cart_with_discounts = apply_clearance(new_cart_with_coupons, cart)
  while index < cart.length
  
  
  
  index += 1 
  end
  
  
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
