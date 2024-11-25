module ParseHelpers

    # All statement helpers
    def handle_let
      next_token

      match(TokenType::IDENT)
      match(TokenType::EQ)

      expression
    end

    def handle_while
      next_token

      comparison

      match(TokenType::LBRACE)
      until check_token(TokenType::RBRACE)
        statement
      end

      match(TokenType::RBRACE)
    end

    def handle_print
      next_token

      if check_token(TokenType::STRING)
        next_token
      else
        next_token
      end

    end

    def handle_if
      next_token

      comparison
      match(TokenType::LBRACE)

      until check_token(TokenType::RBRACE)
        statement
      end

      match(TokenType::RBRACE)
    end

    # Comparison helper
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