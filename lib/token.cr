class Token
  getter :text, :type

  def initialize(text : String, type : Symbol)
    @text = text
    @type = type
  end
end

class TokenType

end