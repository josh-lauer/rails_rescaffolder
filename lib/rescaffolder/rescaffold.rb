module Rescaffolder
  module Rescaffold
    
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      
      def rescaffold(args = {})
        return Rescaffolder::Generator.generate(self, args)
      end

    end

    # module InstanceMethods
    #   def bar
    #     puts "BAR"
    #   end
    # end

  end

end
