module Rescaffolder
  module Rescaffold
    
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      
      def rescaffold(args = {})
        singular_name = self.to_s.underscore
        fields = content_columns.select{|column| !["created_at", "updated_at"].include?(column.name) }
        template = ERB.new Rescaffolder::Template.form
        puts template.result(binding)
      end

    end

    # module InstanceMethods
    #   def bar
    #     puts "BAR"
    #   end
    # end

  end

end
