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
  end
end