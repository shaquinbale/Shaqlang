require "./lex"
require "./parse/parse"


source = File.read("./main.shaq")
lexer = Lexer.new(source)
parser = Parser.new(lexer)

token = Token.new("", TokenType::EOF)

#until lexer.current_char == '\0'
#    token = lexer.get_token
#    p token
#end

parser.program