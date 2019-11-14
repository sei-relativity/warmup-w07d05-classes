class Shop
    def initialize
        @shop_id= rand(1..1000)
        
        @products=[]
    end
    def add_product (nname, nprice, nstock)
        @products.map do |product|
            if product[:name]== nname
                product[:stock]+=nstock
                product[:price]=nprice
                return
            end
        end
        @products<<{name:nname, price:nprice, stock:nstock}

    end
    def sale(precantage)

        @products.map do |product|
            p "#{product[:name]} price is #{product[:price]-(product[:price]*precantage/100)}"
        end
    end
    def stock

        @products.map {|product| puts product[:stock]}
    end
    def purchase(pname,pamount)
    
        @products.map {|product| puts product[:stock]-pamount if product[:name]=pname}
    end
    def show_products

        p @products
        @products.map do |product|
             p product
        end
    end
end

this_shop = Shop.new
this_shop.add_product('apple',10,100)
this_shop.show_products
this_shop.add_product('apple',20,10)
this_shop.add_product('orange',20,200)
# this_shop.show_products

this_shop.show_products