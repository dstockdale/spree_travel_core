class Log

  DEBUG = 0
  INFO = 1
  WARNING = 2
  ERROR = 3

  def self.debug(message)
    options = {}
    options[:prefix] = "DEBUG".green
    options[:message] = message
    options[:level] = DEBUG
    write(options)
  end

  def self.info(message)
    options = {}
    options[:prefix] = "INFO".blue
    options[:message] = message
    options[:level] = INFO
    write(options)
  end

  def self.warning(message)
    options = {}
    options[:prefix] = "WARNING".yellow
    options[:message] = message
    options[:level] = WARNING
    write(options)
  end

  def self.error(message)
    options = {}
    options[:prefix] = "ERROR".red
    options[:message] = message
    options[:level] = ERROR
    write(options)
  end

  # TODO: implementar lo de que solo salga del LEVEL hacia abajo
  def self.write(options = {})
    prefix = options[:prefix] || 'LOG'
    message = options[:message] || 'debugging ...'
    level = options[:level] || DEBUG
    timestamp = Time.now.to_i.to_s.cyan

    log = File.open(Rails.root.to_s + "/log/debug.log", "a")
    log.write("#{timestamp} #{prefix}: #{message}\n")
    log.close
  end
end