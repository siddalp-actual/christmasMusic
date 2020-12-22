\version "2.20.0"

\header {
  title = "In Dulci Jubilo"
  subtitle = " " % a bit more space
  % composer = "J. S. Bach."
  % set tagline to false to remove the lilypond composing notice
  tagline = ##f
}

%\include "articulate.ly"   % better midi dynamics
\include "../peteMacs.ly"  % useful functions

timeAndKey = { \key g \major \time 3/4 }

soprano = \relative c'' {
    \partial 4 g4 | g2 g4 | b2 c4 | d2( e4 | d2)
    \breathe
    d4 | g,2 g4 | b2 c4 | d2( e4 | d2.)
    d2-4 e4 | d2-\tweak Y-offset #4 -5 c4-\tweak Y-offset #4 -4 | b2. | g2
    \breathe
    g4 | a2 a4 | b2 a4 | g2( a4 | b2)
    b4 | d2 e4 | d2 c4 | b2. | g2
    \breathe
    g4 | a2 a4 | b2 a4 | g2( a4 | b2.)
    e,2 e4 | fis2 fis4 | g2.( | d'2. ) |
    \breathe
    b2 b4 | a4( g4) fis4 | g2
    \bar "|."
}

sopranoVFour = \relative c'' {
    \partial 4 g4 | g2 g4 | b2 c4 | d2( e4 | d2)\fermata
    d4 | g,2 g4 | b2 c4 | d2( e4 | d2.)\fermata
    d2 e4 | d2 c4 | b4.( c8 b8 a8) | g2\fermata
    g4( | a2) a4 | b2 a4 | g2( a4 | b2)\fermata
    b4 | d2 e4 | d2 c4 | b4.( c8 b8 a8) | g2\fermata
    g4 | a2 a4 | b2 a4 | g2( a4 | b2.)\fermata
    e,2 e4 | fis2 fis4 | g8( fis8 g8 a8 b8 c8 | d2. )\fermata |
    \override TextSpanner.bound-details.left.text = \markup { \upright "Rallentando"}
    b2\startTextSpan b4 | a2 a4\stopTextSpan | g2.~ | g2\fermata
    \bar "|."
}

smsopranoVFour = \relative c'' {
    \partial 4 g4 | g2 g4 | b2 c4 | d2( e4 | d2)
    \breathe
    d4 | g,2 g4 | b2 c4 | d2( e4 | d2.)
    d2-4 e4 | d2-\tweak Y-offset #4 -5 c4-\tweak Y-offset #4 -4 | b2. | g2
    \breathe
    g4 | a2 a4 | b2 a4 | g2( a4 | b2)
    b4 | d2 e4 | d2 c4 | b2. | g2
    \breathe
    g4 | a2 a4 | b2 a4 | g2( a4 | b2.)
    e,2 e4 | fis2 fis4 | g2.( | d'2.) \fermata |
    b2 b4 | a4( g4) fis4 | g2.( | g2)
    \bar "|."
}

alto = \relative c' {
    %\set fingeringOrientations = #'(up)
    \override Fingering.direction = #UP
    \partial 4 d4 | d2 d4 | d2 g4 | fis2( e4 | fis2)
    g4 | d2 d4 | g2 g4 | fis2( e4 | fis2.)
    g2 g4 | fis2-2 e4-1 | dis2. | e2
    e4 | fis2 fis4 | g2 fis4 | e2( fis4 | g2)
    g4 | g2 g4 | d2 a'4 | fis2. | e2
    e4 | e2 fis4 | g2 e4 | e2( fis4 | g2.) |
    g,2 c4 | a2 a4 | e'2( g4~ | g2 fis4) |
    g2 fis4 | e2 d4 | d2
    \bar"|."
}

altoVFour = \relative c' {
    \partial 4 d4 | e2 e4 | fis2 fis4 | g2.~ | g2
    g4 | g4( fis4) e4 | d2 e4 | d4( fis4 a4 | fis2.)
    g2 g4 | fis4( g4) a4 | dis,4( e4 fis4) | g2\fermata
    g4~( | g4 fis8 e8) fis4 | g2 fis4 | g4.( a8 g8 fis8 | g2)\fermata
    g4 | g2 g4 | a4( g4) a4 | a4( g4 fis4) | e2\fermata
    g4~ | g4 fis8( e8) fis4 | g2 fis4~ | fis4 b,4( e4 | dis2.)\fermata |
    e2 e4~ | e4 d8( e8) fis4~ | fis4 e2( | d2.)\fermata |
    d4( g8 fis8) g4 | g2 fis4 | g8( f8 e8 d8 e8 c8 | d2)\fermata
    \bar"|."
}

tenor = \relative c' {
    \override Fingering.direction = #DOWN
    \partial 4 b4 | b2 b4 | b2 g4 | a4.( b8 cis4 | d2)
    b4 | b2 b4 | d2 e4 | a,4.( b8 cis4 | d2.) |
    b2-2 c4-1 | a2-1 a4 | fis2.-2 | e2-3
    b'4 | d2 d4 | d2 d4 | b2( c4 | d2)
    d4 | b2 c4 | b2 e4 | dis2. | e2
    b4 | c2 d4 | d2 c4 | b2(-2 c4 | d2.) |
    c2 g4 | d'2 d4 | b4.( a8 g4 | a2.) |
    e'2 d4 | c4.( b8) a4 | b2
    \bar "|."
}

tenorVFour = \relative c' {
    \partial 4 b4 | b2 c4 | d2 c4 | b2( c4 | b2)
    b4 | b2 c4 | b4( a4) g4 | a4( d4 cis4 | a2.) |
    b2 c4 | d4( e4) fis4 | b,4( cis4 dis4) | e2
    d4( | e4 c4) d4 | d2 d4 | d4( b4 d4~ | d2)
    d4 | b2 c4 | a2 fis'4 | fis4( e4 dis4) | b2
    d4 | e4( c4) d4 | d2 d4 | b2( c4 | fis,2.) |
    r8 g8( a8 b8) c8( b8) | a4( b8 c8) d8( c8) | b4.( a8 g4 | a2.) |
    b4( c4) d4 | e4( c4) d4~ | d4 c8( b8 c8 a8 | b2)
    \bar "|."
}

smtenorVFour = \relative c' {
    r8 g8( a8 b8) c8( b8) | a4( b8 c8) d8( c8) | b4.( a8 g4 | a2.) |
    b4( c4) d4 | e4( c4) d4~ | d4 c8( b8 c8 a8 | b2)
    \bar "|."
}

su = \change Staff = "up"
sd = \change Staff = "down"

tenorVFourPiano = \relative c' {
    \partial 4 b4 | b2 \su c4 | d2 c4 | b'2( c4 | b2)
    \sd b,4 | b2 \su c4 | \sd b4( a4) g4 | a4( \su d4 cis'4 | a2.) |
    \sd b,2 c4 | d4( e4) \su fis4 | \sd b,4( cis4 dis4) | \su e2
    d4( | e4 c4) d4 | d2 d4 | d4( b4 d4~ | d2)
    d4 | \sd b2 c4 | a2 \su fis'4 | fis4( e4 dis4) | b2
    d4 | e4( c4) d4 | d2 d4 | b2( c4 | \sd fis,2.) |
    r8 g8(-RH a8 b8) c8( b8) | a4( \su b8 c8) d8( c8) | b4.( \sd a8 g4 | a2.) |
    \su b4( c4) d4 | e4( c4) d4~ | d4 c8( b8 c8 a8 | b2)
    \bar "|."
}

tf =
#(define-music-function (parser location f) (number?)
    #{
    \tweak Y-offset #-4 -#f
    #}
)

bass = \relative c' {
    \partial 4 g4 | g2 g4 | g2 e4 | d2.( | d2)
    \breathe
    g4 | g2 g4 | g2 e4 | d2.( | d2.) \break
    g2-\tweak Y-offset #-5 -4 c,4-\tweak Y-offset #-5 -5 | d2-\tweak Y-offset #-5 -4 a4-\tweak Y-offset #-5 -5 | b2.-\tweak Y-offset #-5 -4 | e2
    \breathe
    e4 | d2 d4 | g2 d4 | e2( a4 | g2)
    g4 | \break g2 c,4 | g'2 a4 | b2. | e,2
    \breathe
    e4 | a2 d,4 | g2 a4  | e2(-\tweak Y-offset #-5 -4 a4 | g2.) | \break
    c,2 c4 | d2 d4 | e2.-4( | d2.-5) |
    \breathe
    e2 b4 | c2 d4 | g,2
    \bar "|."
}

bassVFour = \relative c' {
    \partial 4 g4 | e4( d4) c4 | b4( c8 b8) a8( b8) | g8( g'8 f8 e8 d8 c8 | g'2)
    g4 | e4( d4) c4 | g'4( fis4) e4 | fis4( d4 a4 | d2.)\fermata
    \break
    g2 c4~ | c4 b4 a4~ | a4 g4( fis4) | e2\fermata
    b4( | c4 a4) d4 | g,8( a8 b8 c8) d8( c8) | b4( g4 d4 | g2)\fermata
    \break
    g4 | g'4( fis4) e4 | fis4( e4) d4 | g8( a8 b4 b,4) | e2\fermata
    b4 | c4( a4) d4 | g,8( a8 b8 c8) d8( b8)  | e4(  d4 c4 | b2.)\fermata |
    \break
    c4( b4) a4 | d4( c4) b4 | e8( d8 e8 fis8 g8 e8 | fis2.)\fermata |
    g,4( a4) b4 | c4( a4) d4 | b4( c2 | g2)\fermata
    \bar "|."
}

smbassVFour = \relative c' {
    \partial 4 g4 | g2 g4 | g2 e4 | d2.( | d2)
    \breathe
    g4 | g2 g4 | g2 e4 | d2.( | d2.) \break
    g2-\tweak Y-offset #-5 -4 c,4-\tweak Y-offset #-5 -5 | d2-\tweak Y-offset #-5 -4 a4-\tweak Y-offset #-5 -5 | b2.-\tweak Y-offset #-5 -4 | e2
    \breathe
    e4 | d2 d4 | g2 d4 | e2( a4 | g2)
    g4 | g4( fis4) e4 | fis4( e4) d4 | g8( a8 b4 b,4) | e2\fermata
    b4 | c4( a4) d4 | g,8( a8 b8 c8) d8( b8)  | e4(  d4 c4 | b2.)\fermata |
    \break
    c4( b4) a4 | d4( c4) b4 | e8( d8 e8 fis8 g8 e8 | fis2.)\fermata |
    g,4( a4) b4 | c4( a4) d4 | b4( c2 | g2)\fermata
    \bar "|."
}


chorusLyrics = \lyrics {
    % -- gives a - which doesn't eat a note, but may be printed
    % _ doesn't give a -, but does eat a note
    % __ prints _ but doesn't eat a note
}

verseTune = \new Voice = "verseSoprano" \relative c'' {
    g4 g4 f4 g4 | bes4 a4 g2 | g4 ees4 d4 ees4 | c2 c2 |
    c4 c4 ees4 c4 | ees4 f4 g2 | bes4 g4 a4 bes4 | g2 g2 \bar "|."
}

vOneLyrics = \lyrics {
    \verse "1"
    In dul -- ci ju -- bi -- lo __ __
    Now sing with hearts a -- glow! __ __
    Our de -- light and plea -- sure
    %Let us our hom -- age show __ __
    %Our heart's joy re -- cli -- neth
    Lies In præ -- se -- pi -- o. __ __
    Like sun -- shine is our trea -- sure
    %And like a bright star shi -- neth,
    Ma -- tris in gre -- mi -- o, __ __
    Al- pha es et O __
    Al- pha es et O
}

vTwoLyrics = \lyrics {
    \verse "2"
    O Je -- su, par -- vu -- le __ __
    For thee I long al -- way. __ __
    Com -- fort my heart's blind -- ness,
    O pu -- er op -- ti -- me. __ __
    With all thy lov -- ing kind -- ness,
    O prin -- ceps glo -- ri -- æ. __ __
    Tra -- he me post te! __ __
    Tra -- he me post te!
}

vThreeLyrics = \lyrics {
    \verse "3"
    O Pa -- tris car -- i -- tas! __ __
    O Na -- ti le -- ni -- tas! __ __
    Deep -- ly were we stain -- èd
    Per nos -- tra crim -- in -- a: __ __
    But thou for us hast gain -- èd
    Cœ -- lor -- um gau -- di -- a. __ __
    O that we were there! __
    O that we were there!
}

vFourLyrics = \lyrics {
    \verse "4"
    U -- bi sunt gau -- di -- a __ __
    In an -- y place but there? __ __
    There are an -- gels sing -- -- ing
    No -- va can -- ti -- ca __ __
    And there the bells are ring -- ing
    In Re -- gis cu -- ri -- a __ __
    O that we were there
    O that we were there
}

smvFourLyrics = \lyrics {
    \verse "4"
    U -- bi sunt gau -- di -- a __ __
    In an -- y place but there? __ __
    There are an -- gels sing -- -- ing
    No -- o -- va can -- ti -- ca __ __
    And there the bells are ring -- ing
    In Re -- gis cu -- ri -- a __ __
    O that we were there
    O that we were there
}

pianoupper = \relative c'' {
    \tempo 4 = 120

    \clef treble
    \timeAndKey
    <<
        \new Voice {
            \voiceOne
            \repeat volta 3 { \soprano }
            \pageBreak
            \sopranoVFour
        }
        \new Voice {
            \voiceTwo
            \repeat volta 3 {
                \alto
            }
            \altoVFour
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
            \tenorVFourPiano
        }
        \new Voice {
            \voiceTwo
            \repeat volta 3 {
                \bass
            }
            \bassVFour
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
        \break
        \new Voice = "sopranoVoiceVFour" {
            \sopranoVFour
        }
    }
    >>

smsopranostaff = \new Staff
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
        \pageBreak
        \new Voice = "smsopranovoice" {
            \smsopranoVFour
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
        \new Voice = "altoVoiceVFour" {
            \altoVFour
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
        \new Voice = "tenorVoiceVFour" {
            \tenorVFour
        }
    }
    >>

smtenorstaff = \new Staff
    <<
    \staffName "T"
    \relative c'' {
        \clef "G_8"
        \timeAndKey
        s2. * 55 s4
        \new Voice = "smtenorVoiceVFour" {
            \smtenorVFour
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
        \new Voice = "bassVoiceVFour" {
            \bassVFour
        }
    }
    >>

smbassstaff = \new Staff
    <<
    \staffName "B"
    \relative c'' {
        \clef bass
        \timeAndKey
        \repeat volta 3 {
            \bass
        }
        \new Voice = "smbassVoiceVFour" {
            \smbassVFour
        }
    }
    >>

choirScore =
    <<
        \sopranostaff
        \new Lyrics \lyricsto "sopranoVoiceVFour" \vFourLyrics
        \altostaff
        \new Lyrics \lyricsto "sopranovoice" \vOneLyrics
        \new Lyrics \lyricsto "sopranovoice" \vTwoLyrics
        \new Lyrics \lyricsto "sopranovoice" \vThreeLyrics
        \new Lyrics \lyricsto "altoVoiceVFour" \vFourLyrics
        \tenorstaff
        %{
        \new Lyrics \lyricsto "sopranovoice" \vOneLyrics
        \new Lyrics \lyricsto "sopranovoice" \vTwoLyrics
        \new Lyrics \lyricsto "sopranovoice" \vThreeLyrics
        %}
        \new Lyrics \lyricsto "tenorVoiceVFour" \vFourLyrics
        \bassstaff
        \new Lyrics \lyricsto "bassVoiceVFour" \vFourLyrics
    >>

smallChoirScore =
    <<
        \smsopranostaff
        \new Lyrics \lyricsto "sopranovoice" \vOneLyrics
        \new Lyrics \lyricsto "sopranovoice" \vTwoLyrics
        \new Lyrics \lyricsto "sopranovoice" \vThreeLyrics
        \new Lyrics \lyricsto "smsopranovoice" \smvFourLyrics
        \smtenorstaff
        \smbassstaff
        \new Lyrics \lyricsto "smbassVoiceVFour" \smvFourLyrics
    >>

\book {
    \bookOutputName "In Dulci Jubilo - Choir"
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
            \tempo 4 = 120
        }
    }
}

\book {
    \bookOutputName "In Dulci Jubilo - Small Choir"
    \score {
        \new ChoirStaff
        \smallChoirScore
        \layout {
            %#(layout-set-staff-size 16)
            \omit Fingering
            \context {
              \Staff \RemoveEmptyStaves
            }
        }
    }
}

\book{
    \bookOutputName "In Dulci Jubilo - Piano"
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
            \tempo 4 = 120
        }
    }
    \paper {
        annotate-spacing = ##f
    }
}

\book{
    \bookOutputName "In Dulci Jubilo - Alto"
    \score {
        \unfoldRepeats
        \altostaff
        \midi {
            \tempo 4 = 120
        }
    }
}

\book{
    \bookOutputName "In Dulci Jubilo - Tenor"
    \score {
        \unfoldRepeats
        \tenorstaff
        \midi {
            \tempo 4 = 120
        }
    }
}

\book{
    \bookOutputName "In Dulci Jubilo - Intro"
    \score {
        \new PianoStaff {
            <<
            \new Staff {
                \timeAndKey
                <<
                \new Voice {\voiceOne \relative c'' { r2. | g2. }}
                \new Voice {\voiceTwo \relative c' { r2 d4~ | d2.}}
                >>
            }
            \new Staff {
                \clef bass
                \timeAndKey
                <<
                \new Voice {\voiceOne \relative c' { r4 b2~ | b2.}}
                \new Voice {\voiceTwo \relative c' { g2.~ | g2. }}
                >>
            }
            >>
        }
        \layout{}
        \midi {
            \tempo 4 = 120
        }
    }
}

\book {
    \bookOutputName "In Dulci Jubilo - Treble Recorder"
    \score {
        \new PianoStaff {
            \timeAndKey
            \transpose f c { \soprano }
        }
        \layout {}
    }
}


%{}
\score {
    \new staff
    <<
    \staffName "Verses"
    {
        \clef treble
        \timeAndKey
        \verseTune
    }
    \new Lyrics \lyricsto verseSoprano \vOneLyrics
    \new Lyrics \lyricsto verseSoprano \vTwoLyrics
    \new Lyrics \lyricsto verseSoprano \vThreeLyrics
    \new Lyrics \lyricsto verseSoprano \vFourLyrics
    >>
}

\score {
    \unfoldRepeats
    \new ChoirStaff
    <<
        \new Staff
        <<
        \set Staff.midiInstrument = #"acoustic grand"
        % \set midiInstrument = #"glockenspiel"
        \repeat volta 4 {\soprano \verseTune}
        >>
        \new Staff
        <<
            \set Staff.midiInstrument = #"alto sax"
            \repeat volta 4 {\alto  R1*8}
        >>
        \new Staff
        <<
            \set Staff.midiInstrument = #"harpsichord"
            \repeat volta 4 {\tenor R1*8}
        >>
        \new Staff
        <<
            \set Staff.midiInstrument = #"english horn"
            \repeat volta 4 {\bass R1*8}
        >>
    >>
    \midi {
%{        \context {
          \Staff
          \remove "Staff_performer"
        }
        \context {
          \Voice
          \consists "Staff_performer"
        }
        \tempo 2 = 102}
}
%{
%}
