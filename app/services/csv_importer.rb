require 'csv'

class CsvImporter
  attr_accessor :user, :file

  def initialize(user, file)
    @user = user
    @file = file
    @errors = []
  end

  def import
    @errors = []
    CSV.foreach(file_path, headers: true, encoding: 'bom|utf-8') do |row|
      contact_data = map_headers_to_attributes(row)

      credit_card_data = CreditCardProcessor.process(row['Credit Card Number'])
      contact_data['credit_card_number'] = row['Credit Card Number']
      contact_data['credit_card_last_four'] = credit_card_data[:last_four_digits]

      contact = user.contacts.build(contact_data)

      contact.credit_card_network = CreditCardProcessor.identify_network(contact_data['credit_card_number'])

      unless contact.save
        @errors << { row: row.to_h, errors: contact.errors.full_messages }

      end
    end
  rescue StandardError => e
    @errors << { message: "File processing error: #{e.message}" }

  ensure
    File.delete(file_path) if File.exist?(file_path)
  end

  def errors
    @errors
  end

  private

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  def map_headers_to_attributes(row)
    row.to_h.transform_keys do |key|
      case key
      when 'Telephone'
        'phone'
      else
        key.downcase.gsub(' ', '_') # Snake case convertion
      end
    end
  end
end
