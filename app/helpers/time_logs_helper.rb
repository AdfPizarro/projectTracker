module TimeLogsHelper
  def log_image(log)
    if !log.groups.empty?
      log.groups.first.image
    else
      'journal.png'
    end
  end
end
