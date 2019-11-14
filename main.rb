require 'securerandom'

attr_accessor :product_name
class Rand
    def initialize(rand_id, product_name)
        @product_name = product_name
        @rand_id = SecureRandom.hex(3)
    end

    def product_id 
        "#{@rand_id}"
    
    end

    def name 
        "#{@product_name} #{@product_id}"
    end

end


apple = Rand.new('Apple')
puts apple.name