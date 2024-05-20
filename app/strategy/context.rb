class Context
    def initialize(strategy)
      @strategy = strategy
    end
  
    def modify_car(car)
      @strategy.modify(car)
    end
  end
  