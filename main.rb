class Shop
  attr_accessor :name, :shop_id;

  def initialize (name)
    @name = name
    @shop_id = rand(1000)
    @products = []
  end

  def add_product (product_name, price, stock=1)
    check =  @products.select do | product|
       product[:product] == product_name
   end
    if check.empty?
      @products << {product: product_name,
      price: price,
      stock: stock}
    else
      @products[@products.index(check[0])][:stock]+=stock
      puts @products
    end
    
  end
  def sale (sale_pre)
    sale_pre = "0.#{sale_pre}".to_f
    @products.each do | product |
      puts "Name: #{product[:product]} \nPrice: #{(product[:price]*sale_pre).to_f} \nStock: #{product[:stock]}"
    end
  end

  def stock (product_name)
    if !@products.detect {|product| product[:product] == product_name}.nil?
       puts "we have #{@products.select {|product| product[:product] == product_name}[0][:stock]} of #{product_name}"
    else
      puts "sorry we don't have any of #{product_name}"
  end
end

def purchase (product_name, amount)
  if !@products.detect {|product| product[:product] == product_name}.nil?
    if !@products.detect {|product|  product[:product] == product_name && product[:stock] >= amount}.nil?
      @products.select {|product| product[:product] == product_name}[0][:stock] -=amount 
          puts "you bought #{amount} of #{product_name}"
          puts "new stock of #{product_name} is #{@products.select {|product| product[:product] == product_name}[0][:stock]}"
    else 
      puts "sorry we don't have that much of #{product_name}"
    end
 else
   puts "sorry we don't have any of #{product_name}"
end
end
  
  def show_products 
    @products.each do | product |
      puts "Name: #{product[:product]} \nPrice: #{product[:price]} \nStock: #{product[:stock]}"
    end

  end


  def remove_product (product_name)
    check =  @products.select do | product|
       product[:product] == product_name
   end
    if check.empty?
      puts "sorry we don't have any of #{product_name}"
    else
      @products.delete_at(@products.index(check[0]))
      puts @products
    end
  end
end


shop = Shop.new("Supermarket")
    shop.add_product("Apples", 10, 5)
    shop.add_product("Bananas", 6, 2)
    shop.add_product("Apples", 10)

    shop.show_products
    shop.sale(50)

    shop.stock("Bananas")
    shop.stock("Banana")

    shop.purchase('Apples',4)
    shop.purchase('Apples',3)
    shop.purchase('Apple',3)

    shop.remove_product("Bananas")
    shop.remove_product("Bananas")
