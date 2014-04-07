module Spree
  OptionType.class_eval do

    after_create :default_option_value

    def default_option_value
      if attr_type != 'selection' && option_values.empty?
        OptionValue.create(
             :name => self.name,
             :presentation => self.presentation,
             :option_type_id => self.id
         )
      end
    end
    
    # TODO: poner una restriccion que obligue a que el nombre sea en minuscual y sin espacios

  end
end
