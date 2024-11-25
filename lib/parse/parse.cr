require "./parsehelpers"
require "../lex"

class Parser
  include ParseHelpers

  def initialize(lexer : Lexer)
    @lexer = lexer

    @current_token = Token.new("default current", TokenType::EOF)
    @peek_token = Token.new("default peek", TokenType::EOF)

    next_token
    next_token
  end

  def check_token(type : TokenType) : Bool
    @current_token.type == type
  end

  def match(type : TokenType)
    if check_token(type)
      next_token
    else
      raise("Error: Mismatched. Expected #{type}, got #{@current_token.type}")
    end
  end
  
  def check_peek(type : TokenType)
    @peek_token.type == type
  end

  def next_token
    @current_token = @peek_token
    @peek_token = @lexer.get_token.not_nil!
  end

  # program = {statement}
  def program
    puts "Begin parsing"
    while check_token(TokenType::NEWLINE)
      next_token
    end

    until check_token(TokenType::EOF)
      statement
    end
    puts "Parsing done"
  end

  # statement = any of the keywords, really
  def statement
    # 'let', ident, '=', expression, ';'
    if check_token(TokenType::LET)
      handle_let

    # 'while', comparison, '{', {statement}, '}'
    elsif check_token(TokenType::WHILE)
      handle_while

    # 'print', (expression | string), ';'
    elsif check_token(TokenType::PRINT)
      handle_print

    # 'if', comparison, '{', {statement}, '}'
    elsif check_token(TokenType::IF)
      handle_if

    else
      raise("Error: Expected valid keyword, got #{@current_token.type}. The current tokens are #{@current_token}, #{@peek_token}")
    end
  end

  # comparison = expression, (('>' | '>=' | '<' | '<=' | '==' | '!=') ,expression), {('&&' | '||'), comparison}
  def comparison
    puts "-comparison"
    handle_sub_comparison

    # add &&, || support later
  end

  # expression = term, {('+' | '-'), term}
  def expression
    puts "-expression"
    term

    while check_token(TokenType::PLUS) || check_token(TokenType::MINUS)
      next_token
      term
    end
  end

  # term = unary, {('*' | '/'), unary}
  def term
    puts "--term"
    unary

    while check_token(TokenType::ASTERISK) || check_token(TokenType::SLASH)
      next_token
      unary
    end
  end

  # unary = ['+' | '-'], primary
  def unary
    puts "---unary"
    if check_token(TokenType::PLUS) || check_token(TokenType::MINUS)
      next_token
    end
    primary
  end

  # primary = number | ident | '(', expression, ')'
  def primary
    puts "----primary"
    if check_token(TokenType::INT) || check_token(TokenType::FLOAT)
      next_token
    elsif check_token(TokenType::IDENT)
      next_token
    elsif check_token(TokenType::LPAREN)
      next_token
      expression
      match(TokenType::RPAREN)
    end
  end
end