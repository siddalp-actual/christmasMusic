\version "2.20.0"

\header {
  title = "What Child Is This"
  subtitle = " " % a bit more space
  % composer = "J. S. Bach."
  % set tagline to false to remove the lilypond composing notice
  tagline = ##f
}

\include "../peteMacs.ly"  % useful functions

timeAndKey = {\time 6/8 \key e \minor}

soprano = \relative c' {
    %\time 6/8
    \partial 8 e8 | g4 a8 b8.( c16) b8 | a4 fis8 d8.( e16) fis8 |
    g4 e8 e8.( dis16) e8 |   fis4. b,4 e8 |
    g4 a8 b8.( c16) b8 | a4 fis8 d8.( e16) fis8 |
    g8.( fis16) e8 dis8.( cis16) dis8 | e4. e4. \bar "||"
    d'4. d8.( c16) b8 | a4 fis8 d8.( e16) fis8 |
    g4 e8 e8.( dis16) e8 | fis4 dis8 b4. |
    d'4. d8.( c16) b8 | a4 fis8 d8.( e16) fis8 |
    g8.( fis16) e8 dis8.( cis16) dis8 | e4. e4 \bar "|."
    }

alto = \relative c' {
    \partial 8 b8 | e4 d8 d4 g8 | fis4 d8 d4 c8 | b4 b8 a4 e'8 | dis4. b4 b8
    e4 d8 d4 g8 | fis4 d8 d4 c8 | b4 c8 b4 b8 | b4. b4. \bar "||"
    fis'4. b8. a16 g8 | fis4 d8 d4 c8 | b4 b8 a4 e'8 | dis4 b8 b4. |
    fis'4. b8. a16 g8 | fis4 d8 d4 c8 | b4 c8 b4 b8 | b4. b4 \bar "|."
}

tenor = \relative c' {
    \partial 8 g8 | b4 a8 g4 b8 | d4 a8 fis4 a8 | g4 g8 e4 e8 | b'4. b4  g8 |
    b4 a8 g4 b8 | d4 a8 fis4 a8 | g4 a8 fis4 fis8 | g4. g4. \bar "||"
    b4. d4 d8 | d4 a8 fis4 a8 | g4 g8 a4 e8 | b'4 fis8 b4. |
    b4. d4 d8 | d4 a8 fis4 a8 | g4 a8 fis4 fis8 | g4. g4 \bar "|."
}

bass = \relative c {
    \partial 8 e8 | e4 fis8 g4 g8 | d4 d8 d4 dis8 | e4 e8 c4 c8 | b4. b4 e8 |
    e4 fis8 g4 g8 | d4 d8 d4 dis8 | e4 a,8 b4 b8 | e4. e4. \bar "||"
    b'4. g4 g8 | d4 d8 d4 dis8 | e4 e8 c4 c8 | b4 b8 b4. |
    b'4. g4 g8 | d4 d8 d4 dis8 | e4 a,8 b4 b8 | e4. e4 \bar "|."
}

format = \new Voice {
    s8 s2. * 3 s4. s4 \breathe s8 \break
    s2. * 4 \break
    s2. * 4 \break
}

vOne = \lyrics {
    \verse "1"
    What Child is this __ who, laid to rest On Ma -- ry's lap __ is sleep -- ing
    Whom ang -- els greet with an -- thems sweet, While shep -- herds watch
    are keep -- ing?
    This, this __ is Christ the King; __ Whom shep -- herds guard and
    an -- gels sing;
    Haste, haste, to bring him laud __ The Babe, the Son of Ma -- ry
}

vTwo = \lyrics {
    \verse "2"
    Why lies He in __ such mean es -- tate, where ox and ass __ are feed -- ing
    Good Chris -- tian, fear: for sin -- ners here __ The si -- lent Word is plead -- ing
    Nails, spear __ shall pierce him though __ The Cross be borne __ for me, for you;
    Hail, Hail, the Word made flesh, __ The Babe, the Son of Ma -- ry
}

vThree = \lyrics {
    \verse "3"
    So bring Him in -- cense, gold, and myrrh, __ Come pea -- sant, King __ to own him;
    The King of kings __ sal -- va -- tion brings, __ Let lo -- ving hearts en -- throne Him.
    Raise, raise __ the song on high, __ The Vir -- gin sings __ her lull -- a -- by:
    Joy, joy __ for Christ is born, __ The Babe, the Son of Ma -- ry
}

t =\new Voice = "sopranovoice" {
    \voiceOne
    \soprano
}

pianoupper = \relative c'' {
    %\set Staff.printPartCombineTexts = ##f
    \clef treble
    \timeAndKey
    %\partcombine
    <<  \new Voice = "sopranovoice" { \voiceOne \soprano }
        \new Voice { \voiceTwo \alto  }
        \format
    >>
}

pianolower = {
    \set Staff.printPartCombineTexts = ##f
    \clef bass
    \timeAndKey
    \partcombine
    <<  \tenor  >>
    <<  \bass   >>
}

\book {
    \bookOutputName "What Child - Choir"
    \score {
        <<
            \new ChoirStaff
            <<
                %\set PianoStaff.instrumentName ="Piano"
                %\staffName "Piano"
                \new Staff
                <<
                    \clef treble \timeAndKey \tempo 8 = 130
                    \repeat volta 3 { \t }
                    \repeat volta 3 { \new Voice = "altoVoice" { \voiceTwo  \alto }}
                >>
                \new Lyrics \lyricsto "sopranovoice" \vOne
                \new Lyrics \lyricsto "sopranovoice" \vTwo
                \new Lyrics \lyricsto "sopranovoice" \vThree
                \new Staff
                <<
                    \clef bass \timeAndKey
                    \new Voice = "tenorVoice" {
                        \voiceOne
                        \repeat volta 3 \tenor
                    }
                    \new Voice = "bassVoice" {
                        \voiceTwo
                        \repeat volta 3 \bass
                    }
                >>
            >>
            %{  Sadly, doesn't fit on a page with both choir and piano staves
            \new PianoStaff
            <<
                \set PianoStaff.instrumentName ="Piano"
                %\staffName "Piano"
                \repeat volta 3 \new Staff \tempo 8 = 130 \pianoupper
                \repeat volta 3 \new Staff \pianolower
                %\new Lyrics \lyricsto "sopranovoice" \vOne
                %\new Lyrics \lyricsto "sopranovoice" \vTwo
                %\new Lyrics \lyricsto "sopranovoice" \vThree
            >>
            %}
        >>
            \layout {}
        }
        \score {
            \unfoldRepeats
            \new ChoirStaff
            <<
                %\set PianoStaff.instrumentName ="Piano"
                %\staffName "Piano"
                \new Staff
                <<
                    \clef treble \timeAndKey \tempo 8 = 130
                    \repeat volta 3 { \t }
                    \repeat volta 3 { \new Voice = "altoVoice" { \voiceTwo  \alto }}
                >>
                \new Lyrics \lyricsto "sopranovoice" \vOne
                \new Lyrics \lyricsto "sopranovoice" \vTwo
                \new Lyrics \lyricsto "sopranovoice" \vThree
                \new Staff
                <<
                    \clef bass \timeAndKey
                    \new Voice  {
                        \voiceOne
                        \repeat volta 3 \tenor
                    }
                    \new Voice {
                        \voiceTwo
                        \repeat volta 3 \bass
                    }
                >>
            >>
                \midi {
                    \tempo 8 = 130
                }
            }
    }



\book {
    \bookOutputName "What Child - Piano"
    \score {
        \new PianoStaff
        <<
            \set PianoStaff.instrumentName ="Piano"
            %\staffName "Piano"
            \repeat volta 3 \new Staff \tempo 8 = 130 \pianoupper
            \repeat volta 3 \new Staff \pianolower
            \new Lyrics \lyricsto "sopranovoice" \vOne
            \new Lyrics \lyricsto "sopranovoice" \vTwo
            \new Lyrics \lyricsto "sopranovoice" \vThree
        >>
        \layout {}
        \midi {
            \tempo 8 = 130
        }
    }
}

\book {
    \bookOutputName "What Child - Parts"
    \score {
        \new PianoStaff {
            \timeAndKey
            \t
            \alto
            \tenor
            \bass
        }
        \midi {
            \tempo 8 = 130
        }
    }
}

\book {
    \bookOutputName "What Child - Chord"
    \score {
        \new PianoStaff {
            <<
            \new Staff {
                \timeAndKey
                <<
                \new Voice \relative c' { \voiceOne r2. e4 }
                \new Voice \relative c' { \voiceTwo r2 b2 }
                >>
            }
            \new Staff {
                \clef bass
                \timeAndKey
                <<
                \new Voice \relative c' { \voiceOne r4 g2. }
                \new Voice \relative c { \voiceTwo e1 }
                >>
            }
            >>
        }
        \layout {}
        \midi {
            \tempo 8 = 130
        }
    }
}
