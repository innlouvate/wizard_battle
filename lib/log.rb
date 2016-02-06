class Log

  def initialize
    @log = []
  end

  def add(action)
    @log.insert(0, action)
  end

  def display
    @log.join('<p>')
  end

end
