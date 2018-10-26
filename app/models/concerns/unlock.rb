module Unlock
    @@producers = [
        {name: "Producer 1", amount: 0, base_price: 4, base_rate: 1.6, price: 4, growth_rate: 1.07, adjusted_rate: 1.6},
        {name: "Producer 2", amount: 0, base_price: 60, base_rate: 20, price: 60, growth_rate: 1.15, adjusted_rate: 20},
        {name: "Producer 3", amount: 0, base_price: 720, base_rate: 90, price: 720, growth_rate: 1.14, adjusted_rate: 90},
        {name: "Producer 4", amount: 0, base_price: 8640, base_rate: 360, price: 8640, growth_rate: 1.13, adjusted_rate: 360},
        {name: "Producer 5", amount: 0, base_price: 103680, base_rate: 2160, price: 103680, growth_rate: 1.12, adjusted_rate: 2160},
        {name: "Producer 6", amount: 0, base_price: 1244160, base_rate: 6480, price: 1244160, growth_rate: 1.11, adjusted_rate: 6480},
        {name: "Producer 7", amount: 0, base_price: 14929920, base_rate: 19440, price: 14929920, growth_rate: 1.10, adjusted_rate: 19440},
        {name: "Producer 8", amount: 0, base_price: 2149908480, base_rate: 58320, price: 2149908480, growth_rate: 1.09, adjusted_rate:58320 }
    ]

    @@upgrades=[
        {name: "x4 Producer 1", function_name: "x4_p1", price: 20},
        {name: "x4 Producer 2", function_name: "x4_p2", price: 400},
        {name: "x8 Producer 2", function_name: "x8_p4", price: 2000},
        {name: "x5 All", function_name: "x5_all", price: 200000},
        {name: "x_amount Producer 1", function_name: "x_amount_p1", price: 1600000 }
        ]
    @@available_upgrades=[]

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
        upgrade_unlocks
    end
    
    
    def upgrade_unlocks
        
        @@upgrades.each do |upgrade|
            unless @@available_upgrades.include?(upgrade) 
                new_upgrade=Upgrade.new(upgrade)
                if get_stock.amount > 2*(new_upgrade.price)
                    @@available_upgrades.push(upgrade)
                    self.upgrades << new_upgrade
                    new_upgrade.save!
                    self.save!
                end
            end
        end
    end
end
