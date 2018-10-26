module UpgradeFunctions
    
    def x_n_p_name(n,name)
        self.producers.select{|el| el.name=name}.each do |producer|
            producer.adjusted_rate = producer.adjusted_rate*n
        end
    end
    
    def x4_p1
        x_n_p_name(4,"Producer 1")
    end
    
    def x4_p2
        x_n_p_name(4,"Producer 2")
    end
    
    def x8_p4
        x_n_p_name(8,"Producer 2")
    end

    def x5_all
        @production_multi *=5
    end
    
    def x10_all
        @production_multi *=10
    end


    
    def x_amount_p1
        self.producers.select{|el| el.name='Producer 1'}.each do |producer|
            producer.adjusted_rate = producer.adjusted_rate*producer.amount
        end
    end
    
end
