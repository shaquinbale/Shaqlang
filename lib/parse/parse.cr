require 'statementhandlers'
require '../lex'

class Parser
  include StatementHandlers

  def initialize(lexer)
    @lexer = Lexer.new

    @current_token = nil
    @peek_token = nil

    next_token
    next_token
  end

  def check_token(kind : TokenType) : Bool
    @current_token.kind == kind
  end

  def match(kind : TokenType)
    if check_token(kind)
      next_token
    else
      raise("Error: Mismatched. Expected #{kind}, got #{@current_token.kind}")
    end
  end
  
  def check_peek(kind : TokenType)
    @peek_token.kind == kind
  end

  def next_token
    @current_token == @peek_token
    @peek_token == lexer.get_token
  end

  # program = {statement}
  def program
    while check_token(TokenType::NEWLINE)
      next_token
    end

    until @current_token == TokenType::EOF
      statement
    end
  end

  # statement = any of the keywords, really
  def statement
    # 'let', ident, '=', expression, ';'
    if check_token(TokenType::LET)
      handle_let
    end

    # 'while', comparison, '{', {statement}, '}', ';';
    elsif check_token(TokenType::WHILE)
      handle_while
    end

    # 'print', (expression | string), ';'
    elsif check_token(TokenType::PRINT)
      handle_print
    end

    # 'if', comparison, '{', {statement}, '}', ';'
    elsif check_token(TokenType::IF)
      handle_if
    end

    else
      raise("Error: Expected valid keyword, got #{@current_token}")
    end
  end

  # comparison = expression, (('>' | '>=' | '<' | '<=' | '==' | '!=') ,expression), {('&&' | '||'), comparison}
  def comparison
  end

  # expression = term, {('+' | '-'), term}
  def expression
  end

  # term = unary, {('*' | '/'), unary}
  def term
  end

  # unary = ['+' | '-'], primary
  def unary
  end

  # primary = number | ident | '(', expression, ')'
  def primary
  end
end