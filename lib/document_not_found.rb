# encoding: Windows-1252
class DocumentNotFound < StandardError
  def initialize(msg)
    @msg = msg
  end
    
  def msg_formatada
    "-- #{@msg}"
  end
end