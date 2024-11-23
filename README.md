# Shaqlang

A project written in *crystal* to practice compiler/interpreter design.

# **Language Tokens Documentation**

This document outlines the tokens recognized by the language.

---

## **1. Keywords**
Reserved words used to define control flow and variable declarations. These cannot be used as identifiers.

| Token Name | Description        |
|------------|--------------------|
| `LET`      | Declare variables. |
| `WHILE`    | Create loops.      |

---

## **2. Operators**
Operators for mathematical computations and comparisons.

### Arithmetic Operators
| Token Name | Symbol  | Description            |
|------------|---------|------------------------|
| `PLUS`     | `+`     | Addition               |
| `MINUS`    | `-`     | Subtraction            |
| `ASTERISK` | `*`     | Multiplication         |
| `SLASH`    | `/`     | Division               |

### Comparison Operators
| Token Name | Symbol  | Description                 |
|------------|---------|-----------------------------|
| `GT`       | `>`     | Greater than               |
| `GTEQ`     | `>=`    | Greater than or equal to   |
| `LT`       | `<`     | Less than                  |
| `LTEQ`     | `<=`    | Less than or equal to      |
| `EQ`       | `==`    | Equal to                   |
| `NTEQ`     | `!=`    | Not equal to               |

---

## **3. Miscellaneous Tokens**

### Structural Characters
| Token Name | Symbol  | Description              |
|------------|---------|--------------------------|
| `LBRACE`   | `{`     | Start of a code block.   |
| `RBRACE`   | `}`     | End of a code block.     |
| `LPAREN`   | `(`     | Start of a condition.    |
| `RPAREN`   | `)`     | End of a condition.      |

### Special Characters
| Token Name  | Symbol  | Description             |
|-------------|---------|-------------------------|
| `EOF`       | `\0`    | End of file marker.     |
| `NEWLINE`   | `\n`    | Newline character.      |

### Identifiers and Values
| Token Name  | Description                     |
|-------------|---------------------------------|
| `IDENT`     | User-defined variable names.    |
| `INT`       | Integer literals (e.g., `42`).  |
| `FLOAT`     | Float literals (e.g., `3.14`).  |
| `STRING`    | String Literals (e.g. `"Dog"`)  |
| `ASSIGN`    | Assignment operator (`=`).      |

---