module Unlock
    @@producers = [
        {name: "Producer 1", amount: 0, base_price: 4, base_rate: 1.6, price: 4, growth_rate: 1.07},
        {name: "Producer 2", amount: 0, base_price: 60, base_rate: 20, price: 60, growth_rate: 1.15},
        {name: "Producer 3", amount: 0, base_price: 720, base_rate: 90, price: 720, growth_rate: 1.14},
        {name: "Producer 4", amount: 0, base_price: 8640, base_rate: 360, price: 8640, growth_rate: 1.13},
        {name: "Producer 5", amount: 0, base_price: 103680, base_rate: 2160, price: 103680, growth_rate: 1.12},
        {name: "Producer 6", amount: 0, base_price: 1244160, base_rate: 6480, price: 1244160, growth_rate: 1.11},
        {name: "Producer 7", amount: 0, base_price: 14929920, base_rate: 19440, price: 14929920, growth_rate: 1.10},
        {name: "Producer 8", amount: 0, base_price: 2149908480, base_rate: 58320, price: 2149908480, growth_rate: 1.09}
    ]



    def apply_unlocks
        #needs to reduce hits to db

        curr_num_producers = self.producers.size

        if curr_num_producers > @@producers.size - 1
            return false
        end
        #gets next producer
        next_producer_info = @@producers[curr_num_producers]

        if self.get_stock.amount > next_producer_info[:base_price]
            next_producer = Producer.new(next_producer_info)

            self.producers << next_producer
            next_producer.save!
            self.save!
        end
    end



end
