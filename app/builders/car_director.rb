# app/builders/director.rb
class Director
    def initialize(builder)
      @builder = builder
    end
  
    def build(model, capacity, consumption)
      @builder.set_model(model)
      @builder.set_fuel_type
      @builder.set_autonomy(capacity, consumption)
      @builder.set_refuel_cost(capacity)
  
      if @builder.is_a?(ElectricCarBuilder) || @builder.is_a?(HybridCarBuilder)
        @builder.set_refuel_time(capacity)
      end
    end
  end
  