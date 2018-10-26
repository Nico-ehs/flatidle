# module UpgradeFunctions
    
#     def x_n_p_name(n,name)
#         self.producers.select{|el| el.name=name}.each do |producer|
#             # binding.pry
#             producer.adjusted_rate = producer.adjusted_rate*n
#         end
#     end
    
#     def x4_p1
#         x_n_p_name(4,"Producer 1")
#     end
    
#     def x4_p2
#         x_n_p_name(4,"Producer 2")
#     end
    
#     def x8_p4
#         x_n_p_name(8,"Producer 2")
#     end
    
#     def x10_all
#         @production_multi *=10
#     end
    
#     def x_amount_p1
#         self.producers.select{|el| el.name='Producer 1'}.each do |producer|
#             producer.adjusted_rate = producer.adjusted_rate*producer.amount
#         end
#     end
    
# end


class Game < ApplicationRecord
    # t.datetime :start_time
    # t.datetime :updated_time
    before_create :create_default_game
    attr_accessor :production_multi
    attr_accessor :total_production
    attr_accessor :seconds_passed

    belongs_to :user

    has_many :stocks
    has_many :producers

    has_many :available_upgrades
    has_many :upgrades, through: :available_upgrades
    include UpgradeFunctions
    include Unlock

    def get_stock
        stocks.first
    end

    def unbought_upgrades
        available_upgrades.select {|el| !el.purchased }
    end

    def bought_upgrades
        available_upgrades.select {|el| el.purchased }
    end

    def spend(producerice)
        get_stock.amount -= price
        get_stock.save
    end

    def update_time
        self.updated_time=self.created_at unless self.updated_time
        reset_multi
        now = Time.now.round(0)
        apply_upgrades
        self.seconds_passed = (now - updated_time).to_i
        run_ticks
        self.updated_time=now
        self.save
    end


    def run_ticks


        producer_income = 0
        @production_multi = 1
        self.producers.each do |producer|
            producer_income += (producer.amount * producer.adjusted_rate * self.seconds_passed)
        end
        main_stock = get_stock
        @total_production = producer_income * @production_multi
        main_stock.amount += @total_production
        main_stock.save
        apply_unlocks
    end
    
    def reset_multi
        # binding.pry
        self.producers.each do |producer|
            producer.adjusted_rate = producer.base_rate
        end
        @production_multi=1
    end

    def apply_upgrades
        bought_upgrades.map{|el| el.upgrade}.each do |upgrade|
            self.send(upgrade.function_name)
        end
    end

    private

    def create_default_game
        if stocks.empty? && producers.empty?
            # set amount to 0 after adding generate button
            stock1 = Stock.create(resource_name: "Resource 1", amount: 10)
            stocks << stock1
            producer1 = Producer.create(@@producers[0])
            producers << producer1
        end
    end

end


