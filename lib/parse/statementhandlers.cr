module StatementHandlers
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
end