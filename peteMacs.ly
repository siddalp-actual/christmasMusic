% these are functions that have come in handy in Lilypond projects

% Lyric Hints
% -- gives a - which doesn't eat a note, but may be printed
% _ doesn't give a -, but does eat a note
% __ prints _ but doesn't eat a note


stringAppend =
#(define-scheme-function (parser location str1 str2)(string? string?)
   (string-append str1 str2))

verse =
#(define-music-function (parser location nm) (number-or-string?)
    #{\set stanza = \stringAppend "Verse " #nm
    #}
)

staffName =
    #(define-music-function (parser location nm) (number-or-string?)
    #{ \set Staff.instrumentName = #nm
    #}
)
