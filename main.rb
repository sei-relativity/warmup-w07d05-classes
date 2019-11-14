class Shop
    def initialize(name)
        @shop_name = name
        @stock = []
        @shop_id = rand(1000000000)
    end
    def add_product(name, price, stock = 1)
        if @stock == []
            @stock.push([name, price, stock])
        else
            @stock.each do |value|
                if value[0] == name
                    value[2] += 1
                else
                    @stock.push([name, price, stock])
                end
            end
        end
    end
    def sale(num)
        num = num.to_f
        @stock.each do |index|
            p "#{index[0]} is now #{index[1]*(num/100)}"
        end
    end
    def stock(name)
        @stock.each do |value|
            if value[0] == name
                p "#{value[0]} has #{value[2]}"
            end
        end
    end
    def show_products
        @stock.each do |value|
            p "Name: #{value[0]}"
            p "Price: #{value[1]}"
            p "Stock: #{value[2]}"
        end
    end
    def remove_product(name)
        index = 0
        @stock.each do |value|
            if value[0] == name
                @stock.delete_at(index)
            else
                index +=1
            end
        end
    end
    def purchase(name)
        @stock.each do |value|
            if value[0] == name
                value[2] -= 1
            end
        end
    end
 end
 shop = Shop.new("Supermarket")
 shop.add_product("Apples", 10, 5)
 shop.add_product("Bananas", 6, 2)
 shop.add_product("Apples", 10)
 shop.show_products
 shop.sale(50)
 shop.purchase("Bananas")
 shop.stock("Bananas")
 shop.remove_product("Bananas")
 shop.show_products