class Shops
    attr_accessor :id
    attr_accessor :products
    attr_accessor :stock
    def initialize
      @id = rand(10000)
      @products = Array.new
  
    end
  
    def add_product(name,price,stock =1)
      @products.push({"name"=>name, "price"=> price, "stock"=> stock})
  
    end
  
    def sale(percentage)
      @products.each do |product|
        product["price"] *= (percentage.to_f/100)
      end
    end
  
    def stock
      @products.each do |product|
        puts "Product Name: #{product['name']} || Stock: #{product['stock']}"
      end
    end
  end
  
  a = Shops.new
  a.add_product('apple',100,3)
  a.add_product('orange',250,3)
  puts 'OLD PRICES =============='
  puts a.products
  a.sale(50.44)
  puts 'New After The Sale PRICES =============='
  puts a.products
  puts a.stock 