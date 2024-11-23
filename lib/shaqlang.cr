require "./lex"


source = "let dog = 5 # this is a comment \n"
lexer = Lexer.new(source)

token = Token.new("", TokenType::EOF)

until lexer.current_char == '\0'
    token = lexer.get_token
    p token
end