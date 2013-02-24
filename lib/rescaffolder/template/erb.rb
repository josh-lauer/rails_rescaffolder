module Rescaffolder
  module Template
    class ERB < Rescaffolder::Template::Base

      def self.form
<<-STRING
<%%= form_for @<%= singular_name %> do |f| %><% fields.each do |field| %>
  <div class="field">
    <%%= f.label <%= field.name.intern.inspect %> %>
    <%= Rescaffolder::Template::ERB.field_markup(field) %>
  </div><% end %>
  <div class="actions">
    <%%= f.submit %>
  </div>
<%% end %>
STRING
      end

      def self.field_markup(field)
        "<%= #{super} %>"
      end

    end
  end
end