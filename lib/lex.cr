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
  when /[0-9]/
    token = handle_nums
  when /[a-zA-Z]/
    token = handle_letters
  when /[{}()]/
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
      return Token.new(@current_char, TokenType::PLUS)
    when '-'
      return Token.new(@current_char, TokenType::MINUS)
    when '*'
      return Token.new(@current_char, TokenType::ASTERISK)
    when '/'
      return Token.new(@current_char, TokenType::SLASH)
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
      raise "Error: Unexpected comparison operator: #{@current_char}"
    end
  end

  # Can return either a float or an int, depending on the existence of a .
  def handle_nums : Token
    start_pos = @current_pos
    is_float = false

    while peek =~ /[0-9]/
      next_char
    end

    if peek == '.'
      is_float = true
      next_char

      if peek !~ /[0-9]/
        raise "Error: Expected a num after decimal. Got #{peek}"
      end
    end

    while peek =~ /[0-9]/
      next_char
    end

    token_type = is_float ? TokenType::FLOAT : TokenType::INT
    token_number = @source[start_pos..@current_pos]
    return Token.new(token_number, token_type)
  end
  
  def handle_letters : Token

  def handle_structures : Token
end