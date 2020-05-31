module RailsAdmin
  module Services

    def number_currency(number)
      number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
    end

  end
end