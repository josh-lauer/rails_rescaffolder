module Rescaffolder
  class Collection

    def self.model_associations
      {}
    end

    def content_column_hash(klass)
      {}.tap do |model_hash|
        klass.content_columns.each do |column|
          model_hash[column.name] = column unless ["created_at", "updated_at"].include?(column.name)
        end
      end
    end

  end
end