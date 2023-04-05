class CsvImportJob < ApplicationJob
  queue_as :default

  def perform(contact_file_id, user_id)
    contact_file = ContactFile.find_by(id: contact_file_id)
    return unless contact_file # return if contact_file is not found
    contact_file.update(status: 'processing')

    importer = CsvImporter.new(User.find_by(id: user_id), contact_file.file)
    importer.import

    debugger
    if importer.errors.empty?
      contact_file.update(status: 'finished', error_messages: [])
    elsif importer.errors.any? { |error| error[:row].present? }
      contact_file.update(status: 'finished', error_messages: importer.errors)
    else
      contact_file.update(status: 'failed', error_messages: importer.errors)
    end
  rescue StandardError => e
    contact_file.update(status: 'failed', error_messages: [{ message: "File processing error: #{e.message}" }])
  end
end
