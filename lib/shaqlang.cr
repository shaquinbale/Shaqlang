require "./lex"


source = "+-/*"
lexer = Lexer.new(source)

token = Token.new("", TokenType::EOF)

until token.text == '\0' do
    token = lexer.get_token
    puts token.text
end