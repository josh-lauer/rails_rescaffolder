module Rescaffolder
  class Template

    def self.form
      # <<-STRING
      #   <%%= form_for @<%= singular_name %> do |f| %>
      #     <%%= f.inputs do %>
      #     <%- column_ary.each do |column| -%>
      #       <%%= f.input :<%= column.name %> %>
      #     <%- end -%>
      #     <%% end %>

      #     <%%= f.actions do %>
      #       <%%= f.action :submit, :as => :input %>
      #     <%% end %>
      #   <%% end %>
      # STRING
      <<-STRING
<%%= form_for @<%= singular_name %> do |f| %><% fields.each do |field| %>
  <div class="field">
    <%%= f.label <%= field.name.intern.inspect %> %>
    <%= Rescaffolder::Template.field_markup(field) %>
  </div><% end %>
  <div class="actions">
    <%%= f.submit %>
  </div>
<%% end %>
      STRING
    end

    def self.field_markup(field)
      # output = "<div class=\"field\">\n    <%= f.label #{field.name.intern.inspect} %>\n    "
      output = ""
      output << case field.type
        when :string
          "<%= f.text_field #{field.name.intern.inspect} %>"
        when :text
          "<%= f.text_area #{field.name.intern.inspect} %>"
        when :integer, :float, :decimal
          "<%= f.number_field #{field.name.intern.inspect} %>"
        when :datetime, :timestamp
          "<%= f.datetime_select #{field.name.intern.inspect} %>"
        when :time
          "<%=  %>"
        when :date
          "<%= f.date_select #{field.name.intern.inspect} %>"
        when :binary
          "<%=  %>"
        when :boolean
          "<%= f.check_box #{field.name.intern.inspect} %>"
        else ""
      end
      # output << "\n  </div>"
      return output
    end

  end
end