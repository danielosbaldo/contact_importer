class CreditCardProcessor
  class << self
    NETWORKS = {
      'visa': /^4\d{12}(?:\d{3})?$/,
      'mastercard': /^(5[1-5]\d{4}|677154)\d{10}$/,
      'amex': /^3[47]\d{13}$/,
      'discover': /^6(?:011|5[0-9]{2})\d{12}$/,
      'diners_club': /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
      'jcb': /^(?:2131|1800|35\d{3})\d{11}$/
    }.freeze
    def process(card_number)
      last_four_digits = card_number[-4..-1]

      {
        last_four_digits: last_four_digits,
      }
    end

    def identify_network(card_number)
      NETWORKS.each do |network, pattern|
        return network.to_s if card_number =~ pattern
      end

      'unknown'
    end

    private

    def encrypt_credit_card_number(card_number)
      Contact.credit_card_number.encrypt(card_number)
    end
  end
end
