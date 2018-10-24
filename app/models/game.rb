class Game < ApplicationRecord
    # t.datetime :start_time
    # t.datetime :updated_time
    before_create :create_default_game

    attr_accessor :seconds_passed

    belongs_to :user

    has_many :stocks
    has_many :producers

    has_many :available_upgrades
    has_many :upgrades, through: :available_upgrades

    include Unlock


    def output
        output_string=''
        output_string+="\n"
        output_string+="\n"+ "User: #{user.name}"
        output_string+="\n"+ "#{seconds_passed} seconds passed"
        self.stocks.each do |stock|
            output_string+="\n"+ "#{stock.resource_name}: #{stock.amount}"
        end
        output_string+="\n"+ "Producers"
        self.producers.each do |producer|
            output_string+="\n"+ "#{producer.name}: #{producer.amount}"
            output_string+="\n"+ "Producing : #{(producer.amount)*(producer.base_rate)} per second"
        end
        puts output_string
        # output_string+="\n"+ "Upgrades"
        # self.upgrades.each do |upgrade|
        #   output_string+="\n"+ "#{upgrade.name}"
        # end
    end

    def get_stock
        stocks.first
    end
    
    def unbought_upgrades 
        available_upgrades.select {|el| !el.purchased }
    end
    
    def bought_upgrades 
        available_upgrades.select {|el| el.purchased }
    end
    
    
    def spend(price)
        get_stock.amount -= price
        get_stock.save
    end

    def update_time
        self.updated_time=self.created_at unless self.updated_time
        now = Time.now.round(0)
        # apply_upgrades
        self.seconds_passed = (now - updated_time).to_i
        run_ticks
        self.updated_time=now
        self.save
    end


    def run_ticks
        main_stock = get_stock
        apply_unlocks
        self.producers.each do |producer|
            main_stock.amount += (producer.amount*producer.base_rate*self.seconds_passed)
        end
        main_stock.save
    end

    def apply_upgrades
        self.producers.each do |producer|
            producer.adjusted_rate = producer.base_rate
            producer.save
        end
        upgrade_purchases.upgrades.each do |upgrade|
            self.send(upgrade.function_name)
        end
    end

    private

    def create_default_game
        if stocks.empty? && producers.empty?
            # set amount to 0 after adding generate button
            stock1 = Stock.create(resource_name: "Resource 1", amount: 10)
            stocks << stock1
            producer1 = Producer.create(name: "Producer 1", amount: 0, base_price: 4, base_rate: 1.6, price: 4, growth_rate: 1.07)
            producers << producer1
        end
    end

end


module UpgradeFuntions
    def x2
        self.producers.each do |producer|
            producer.adjusted_rate = producer.adjusted_rate
            producer.save
        end
    end
end
