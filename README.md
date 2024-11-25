# Shaqlang

A project written in *crystal* to practice compiler creation with the end goal of bootstrapping itself.

# **Token Documentation**

This document outlines the tokens recognized by the language.

---

## **1. Keywords**
Reserved words used to define control flow and variable declarations. These cannot be used as identifiers.

| Token Name | Description        |
|------------|--------------------|
| `LET`      | Declare variables. |
| `WHILE`    | Create loops.      |
| `PRINT`    | Print to STDOUT.   |
| `IF`       | Basic Control Flow.|
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
| `SEMICOL`  | `;`     | End of statement         |

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

# EBNF Tree

```
program = {statement};

statement = 'let', ident, '=', expression, ';'
                 |  'print', (expression | string), ';'
                 |  'if', comparison, '{', {statement}, '}'
                 |  'while', comparison, '{', {statement}, '}';

comparison = expression, (('>' | '>=' | '<' | '<=' | '==' | '!=') ,expression), {('&&' | '||'), comparison};

expression = term, {('+' | '-'), term};

term = unary, {('*' | '/'), unary};

unary = ['+' | '-'], primary;

primary = number | ident | '(', expression, ')';
```