module Rescaffolder
  
  class Field

    def initialize(args = {})
      @label = args[:label]
      @datatype = args[:datatype]
      @value = args[:value]
    end
    attr_reader :label, :datatype, :value

  end

  class Column < ::Rescaffolder::Field
    def initialize(args = {})
      @column = args[:column]
      super(label: @column.name, datatype: @column.type, value: @column.default)
    end

  end

  class Association < ::Rescaffolder::Field
    def initialize(args = {})
      
    end
  end

end
