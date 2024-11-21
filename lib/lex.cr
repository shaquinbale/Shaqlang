require "./token"

# Responsible for lexing the source code into tokens
class Lexer
  def initialize(source : String)
    @source = source
    @current_pos = -1
    @current_char = ''
    next_char
  end

  # Increments to the next character
  def next_char
    @current_pos += 1
    @current_char = @source[@current_pos]
  end

  def peek : String
    @source[@current_pos + 1]
  end
end

enum 