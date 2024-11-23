require "./token"

# Responsible for lexing the source code into tokens
class Lexer
  def initialize(source : String)
    @source = source + '\0'
    @current_pos = -1
    @current_char = "Uninitialized"
    next_char
  end

  # Increments to the next character
  def next_char
    @current_pos += 1
    @current_char = @source[@current_pos]
  end

  # Returns the character one index ahead
  def peek : Char
    @source[@current_pos + 1]
  end

  # Increments to the next character until @current_char isn't whitespace
  def skip_whitespace
    while @current_char == ' ' || @current_char == "\t" || @current_char == "\r"
      self.next_char
    end
  end

  # Skips comments which begin with '#'
  def skip_comments
    until @current_char == '\n'
      next_char 
    end
  end

  # Returns the next token
  def get_token : Token
    token = nil

  case @current_char
  when '+', '-', '*', '/'
    token = handle_arithmetic_operator
  when '>', '<', '=', '!'
    token = handle_comparison_operator
  when /0-9/
    token = handle_nums
  when /a-zA-Z/
    token = handle_letters
  when '\0'
    token = Token.new(@current_char, TokenType::EOF)
  else
    raise "Token not recognized: #{@current_char}"
  end

    next_char
    token
  end

  def handle_arithmetic_operator : Token
    case @current_char
    when '+'
      token = Token.new(@current_char, TokenType::PLUS)
    when '-'
      token = Token.new(@current_char, TokenType::MINUS)
    when '*'
      token = Token.new(@current_char, TokenType::ASTERISK)
    when '/'
      token = Token.new(@current_char, TokenType::SLASH)
    else
      raise "Error: Expected an arithmetic operator."
    end
  end

  def handle_comparison_operator : Token
    case @current_char
    when '>'
      return peek == '=' ? Token.new("#{@current_char}#{peek}", TokenType::GTEQ).tap { next_char } : Token.new(@current_char, TokenType::GT)
    when '<'
      return peek == '=' ? Token.new("#{@current_char}#{peek}", TokenType::LTEQ).tap { next_char } : Token.new(@current_char, TokenType::LT)
    when '='
      return peek == '=' ? Token.new("#{@current_char}#{peek}", TokenType::EQ).tap { next_char } : Token.new(@current_char, TokenType::ASSIGN)
    when '!'
      return peek == '=' ? Token.new("#{@current_char}#{peek}", TokenType::NTEQ) : raise "Expected a '=' after '!'"
    else
      raise "Unexpected comparison operator: #{@current_char}"
    end
  end

  #def handle_nums : Token
  
  #def handle_letters : Token
end