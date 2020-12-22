\version "2.20.0"

\header {
  title = "Angel Voices Richly Blending"
  subtitle = " " % a bit more space
  % composer = "J. S. Bach."
  % set tagline to false to remove the lilypond composing notice
  tagline = ##f
}

%\include "articulate.ly"   % better midi dynamics
\include "../peteMacs.ly"  % useful functions

timeAndKey = { \key f \major \time 3/4 }

soprano = \relative c' {
    f2 a4 | c2 a4 | bes4( c4) d4 | c2 g4 | \breathe
    a4( bes4) c4 | bes4( a4) g4 | f2 d4 | e2 c4 | \break
    a'2  bes4 | c2 d4 | c2 g4 | a2 f4 | \breathe
    bes2 bes4 | a4( g4) f4 | f4( d4) e4 | f2.
    \bar "|."
}

%{
soprano = \relative c' {
    f2 a4 | c2 a4 | bes4( c4) d4 | c2 g4 | \break
    a4( bes4) c4 | bes4( a4) g4 | f2 d4 | e2 c4 | \break
    a'2  bes4 | c2 d4 | c2 g4 | a2 f4 | \break
    bes2 bes4 | a4( g4) f4 | f4( d4) e4 | f2.
    \bar "|."
}
%}
alto = \relative c' {
    \override Fingering.direction = #UP
    f2 f4 | g2 f4 | f2 f4 | f2 f4 |
    f2 f4 | d2 e4 | d2 b4 | c2 c4 |
    c2 f4 | f2 f4 | f2 e4 | e2 d4 |
    d2 g4 | e2 d4 | d2 c4 | c2.
    \bar"|."
}

su = \change Staff = "up"
sd = \change Staff = "down"

tenor = \relative c' {
    \override Fingering.direction = #DOWN
    a2 c4 | c2 c4 | bes2 bes4 | g4( a4) bes4 |
    a2 a4 | bes2 bes4 | a2 g4 | g2 e4 |
    f2 f4 | f2 bes4 | g4( a4) bes4 | a2 a4 |
    \su bes2 d4 | c2 \su a4 | bes2 bes4 | a2.
    \bar "|."
}

tf =
#(define-music-function (parser location f) (number?)
    #{
    \tweak Y-offset #-4 -#f
    #}
)

bass = \relative c {
    f2 f4 | e2 f4 | d2 bes4 | c2 c4 |
    f2 a4 | g2 c,4 | d2 g4 | c,2 c4 |
    f2 d4 | a2 bes4 | c2 c4 | cis2 d4 |
    g,2 g4 | a2 d4 | g,2 c4 | f,2 .
    \bar "|."
}

chorusLyrics = \lyrics {
    % -- gives a - which doesn't eat a note, but may be printed
    % _ doesn't give a -, but does eat a note
    % __ prints _ but doesn't eat a note
}

vOneLyrics = \lyrics {
    \verse "1"
    An -- gel voi -- ces rich __ ly blend -- ing,
    Shep __ herds to __ the mang -- er send -- ing.
    Sing of peace from heav'n de -- scend -- ing,
    Shep -- herds, greet __ your Shep __ herd King.
}

vTwoLyrics = \lyrics {
    \verse "2"
    Lo! A star is bright -- ly glow --ing!
    East -- ern Kings __ their gifts are show -- ing
    to the King whose gifts pass know -- ing!
    Gen -- tiles, greet__ the Gen -- tiles King
}

vThreeLyrics = \lyrics {
    \verse "3"
    To the man -- ger, come ad -- or -- ing
    Hearts __ in thank -- ful -- ness out -- pour -- ing
    To the child, true peace re -- stor -- ing
    Ma -- ry's Son, our God __ and King!
}

vFourLyrics = \lyrics {
    \verse "4"
}

pianoupper = \relative c'' {
    \tempo 2 = 72

    \clef treble
    \timeAndKey
    <<
        \new Voice = "sopranovoice" {
            \voiceOne
            \repeat volta 3 { \soprano }
        }
        \new Voice {
            \voiceTwo
            \repeat volta 3 {
                \alto
            }
        }
    >>
}

pianolower = \relative c {
    \clef bass
    \timeAndKey
    <<
        \new Voice {
            \voiceOne
            \autochange cis'
            \repeat volta 3 {
                \tenor
            }
        }
        \new Voice {
            \voiceTwo
            \repeat volta 3 {
                \bass
            }
        }
        %\voiceTwo \bass
    >>
}

pianostaff =
    <<
        \set PianoStaff.instrumentName = "Piano"
        %\staffName "Piano"
        \new Staff = "up" \pianoupper
        \new Staff = "down" \pianolower
        \new Lyrics \lyricsto "sopranovoice" \vOneLyrics
        \new Lyrics \lyricsto "sopranovoice" \vTwoLyrics
        \new Lyrics \lyricsto "sopranovoice" \vThreeLyrics
    >>

sopranostaff = \new Staff
    <<
    \staffName "S"
    \relative c'' {
        \clef treble
        \timeAndKey
        \new Voice = "sopranovoice" {
            \repeat volta 3 {
                \soprano
            }
        }
    }
    >>

altostaff = %\new stave \alto
    \new Staff
    <<
    \staffName "A"
    \relative c'' {
        \clef treble
        \timeAndKey
        \repeat volta 3 {
            \alto
        }
    }
    >>

tenorstaff = \new Staff
    <<
    \staffName "T"
    \relative c'' {
        \clef "G_8"
        \timeAndKey
        \repeat volta 3
        {
            \tenor
        }
    }
    >>

bassstaff = \new Staff
    <<
    \staffName "B"
    \relative c'' {
        \clef bass
        \timeAndKey
        \repeat volta 3 {
            \bass
        }
    }
    >>

choirScore =
    <<
        \sopranostaff
        \altostaff
        \tenorstaff
        \new Lyrics \lyricsto "sopranovoice" \vOneLyrics
        \new Lyrics \lyricsto "sopranovoice" \vTwoLyrics
        \new Lyrics \lyricsto "sopranovoice" \vThreeLyrics
        \bassstaff
    >>

\book {
    \bookOutputName "Angel Voices - Choir"
    \score {
        \new ChoirStaff
        \choirScore
        \layout {
            #(layout-set-staff-size 16)
            \omit Fingering
        }
    }
    \score {
        \unfoldRepeats
        \new ChoirStaff
        \choirScore
        \midi {
            \tempo 2 = 72
        }
    }
}

\book{
    \bookOutputName "Angel Voices - Piano"
    %\overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
    %#'((Y-offset . 2))
    \score {
        %\articulate
        <<
        \new PianoStaff
        \pianostaff
        >>
        \layout {
            \context {
                \Staff
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #1
            }
        %\overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
        %#'((Y-offset . 5))
        }
        \midi {
            \tempo 2 = 72
        }
    }
    \paper {
        annotate-spacing = ##f
    }
}

\book{
    \bookOutputName "Angel Voices - Alto"
    \score {
        \unfoldRepeats
        \altostaff
        \midi {
            \tempo 2 = 72
        }
    }
}

\book{
    \bookOutputName "Angel Voices - Tenor"
    \score {
        \unfoldRepeats
        \tenorstaff
        \midi {
            \tempo 2 = 72
        }
    }
}

\book{
    \bookOutputName "Angel Voices - Intro"
    \score {
        \new PianoStaff {
            <<
            \new Staff {
                \timeAndKey
                <<
                \new Voice {\voiceOne \relative c'' { r2. | f2. }}
                >>
            }
            \new Staff {
                \clef bass
                \timeAndKey
                <<
                \new Voice {\voiceOne \relative c' { r4 a2~ | a2.}}
                \new Voice {\voiceTwo \relative c' { f2.~ | f2. }}
                >>
            }
            >>
        }
        \layout{}
        \midi {
            \tempo 4 = 72
        }
    }
}

%{
\book {
    \bookOutputName "Angel Voices - Treble Recorder"
    \score {
        \new PianoStaff {
            \timeAndKey
            \transpose f c { \soprano }
        }
        \layout {}
    }
}
%}
