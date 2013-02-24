module Rescaffolder
  class Generator
    
    def self.generate(model, args = {})
  		singular_name = model.to_s.underscore
      fields = model.content_columns.select{|column| !["created_at", "updated_at"].include?(column.name) }
      template = ERB.new Rescaffolder::Template.form(args)
      result = template.result(binding)
      return result
    end

  end
end