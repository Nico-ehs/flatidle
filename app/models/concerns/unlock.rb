module Unlock
    @@producers = [
        Producer.new(name: "Producer 1", amount: 1, base_rate: 1, price: 4)
    ]
    @stock_goal = 4
    def apply_unlocks
        if self.get_stock.amount > @stock_goal
            @stock_goal = @stock_goal * 12
            next_producer_index = self.producers.size
            if next_producer_index > @@producers.size - 1
                raise "GAME WON, I guess"
            end
            next_producer = @@producers[next_producer_index]
            next_producer.save
            self.producers << next_producer 


        end
    end
    
end


