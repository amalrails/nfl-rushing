class ImportFileJob < ApplicationJob
  queue_as :default

  def perform(file)
    Rushing.import(file)
  end
end
