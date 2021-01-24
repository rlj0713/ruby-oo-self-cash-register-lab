
class CashRegister

    attr_accessor :total, :discount, :shopping_cart, :values

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @shopping_cart = []
        @values = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        quantity.times {@shopping_cart.push(title)}
        @values << price
        self.total += (price * quantity)
    end

    def apply_discount
        if discount > 0
            @total = (@total * (100 - discount)) / 100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        return @shopping_cart
    end

    def void_last_transaction
        @total = @values[0...-1]
        sum = 0
        @total.each do |i|
            sum += i
        end
        @total = sum
    end

end