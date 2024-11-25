struct Token
  getter :text, :type

  def initialize(text : (String | Char), type : TokenType)
    @text = text
    @type = type
  end
end

enum TokenType
  # Keywords
  LET = 100  # let
  WHILE      # while
  PRINT      # print
  IF         # if

  # Operators
  PLUS = 200 # +
  MINUS      # -
  ASTERISK   # *
  SLASH      # /

  GT         # >
  GTEQ       # >=
  LT         # <
  LTEQ       # <=
  EQ         # ==
  NTEQ       # !=

  # Identifiers and values
  INT = 300 # i.e. 42
  FLOAT     # i.e. 3.14
  STRING    # i.e. "Dog"
  ASSIGN    # =
  IDENT     # i.e. x

  # Misc.
  LBRACE = 400 # {
  RBRACE       # }
  LPAREN       # (
  RPAREN       # )

  EOF       # /0
  NEWLINE   # /n
end