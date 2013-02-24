module Rescaffolder
  module Template
    class HAML < Rescaffolder::Template::Base

      def self.form
<<-STRING
= form_for @<%= singular_name %> do |f|<% fields.each do |field| %>
  .field
    = f.label <%= field.name.intern.inspect %>
    <%= Rescaffolder::Template::HAML.field_markup(field) %><% end %>
  .actions
    = f.submit
STRING
      end

      def self.field_markup(field)
        "= #{super}"
      end

    end
  end
end