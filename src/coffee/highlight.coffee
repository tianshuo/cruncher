terminal2class =
    error: 'error'
    EOF: 'eof'
    NUMBER: 'number'
    PLUS: 'op'
    MINUS: 'op'
    MUL: 'op'
    DIV: 'op'
    POW: 'op'
    PAREN_OPEN: 'paren'
    PAREN_CLOSE: 'paren'
    HEADING: 'heading'
    EQUALS: 'equals'

id2class = {}
for terminal, id of parser.symbols_
    id2class[id] = terminal2class[terminal]

CodeMirror.defineMode 'cruncher', ->
    startState: ->
        parser.lexer

    token: (stream, lexer) ->
        lexer.setInput stream.string[stream.pos ...]
        id = lexer.next()
        for i in [0 ... lexer.yytext.length]
            stream.next()

        return id2class[id]
