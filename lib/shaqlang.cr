require "./lex"


source = %q("dog" 2)
lexer = Lexer.new(source)

token = Token.new("", TokenType::EOF)

until lexer.current_char == '\0'
    token = lexer.get_token
    p token
end