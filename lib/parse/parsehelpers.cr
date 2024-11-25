module ParseHelpers

    # All statement helpers
    def handle_let
      puts "statement-LET"
      next_token

      match(TokenType::IDENT)
      match(TokenType::ASSIGN)

      expression
      match(TokenType::SEMICOL)
    end

    def handle_while
      puts "statement-WHILE"
      next_token

      comparison

      match(TokenType::LBRACE)
      until check_token(TokenType::RBRACE)
        statement
      end

      match(TokenType::RBRACE)
    end

    def handle_print
      puts "statement-PRINT"
      next_token
      match(TokenType::LPAREN)

      if check_token(TokenType::STRING)
        next_token
      else
        expression
      end

      match(TokenType::RPAREN)
      match(TokenType::SEMICOL)
    end

    def handle_if
      puts "statement-IF"
      next_token

      comparison
      match(TokenType::LBRACE)

      until check_token(TokenType::RBRACE)
        statement
      end

      match(TokenType::RBRACE)
    end

    # Comparison helpers
    def is_comparison_operator?
      check_token(TokenType::GT) || check_token(TokenType::GTEQ) || check_token(TokenType::LT) || check_token(TokenType::LTEQ) || check_token(TokenType::EQ) || check_token(TokenType::NTEQ)
    end

    def handle_sub_comparison
      expression

      if is_comparison_operator?
        next_token
      else
        raise("Error: Expected comparison operator, got #{@current_token.type}")
      end

      expression
    end
end