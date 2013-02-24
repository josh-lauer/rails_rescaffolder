module Rescaffolder
  module Template
    
    def self.form(args = {})
      language = args[:language] ? args[:language] : :erb
      subclass_matches = self::Base.subclasses.select{ |sc| sc.to_s.downcase == "rescaffolder::template::#{language.to_s.downcase}" }
      if subclass_matches.empty?
        valid_languages = Rescaffolder::Template::Base.subclasses.map{|sc| '"'+sc.to_s.split('::')[-1].downcase+'"'}.join(', ')
        raise "Invalid language: \"#{language.to_s}\", valid choices are #{valid_languages}" 
      end
      return subclass_matches.first.form
    end

  end
end