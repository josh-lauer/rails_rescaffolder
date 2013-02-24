module Rescaffolder
  module Template
    class Base

      def self.field_markup(field)
        case field.type
          when :string
            "f.text_field #{field.name.intern.inspect}"
          when :text
            "f.text_area #{field.name.intern.inspect}"
          when :integer, :float, :decimal
            "f.number_field #{field.name.intern.inspect}"
          when :datetime, :timestamp
            "f.datetime_select #{field.name.intern.inspect}"
          when :time
            ""
          when :date
            "f.date_select #{field.name.intern.inspect}"
          when :binary
            ""
          when :boolean
            "f.check_box #{field.name.intern.inspect}"
          else ""
        end
      end

    end
  end
end