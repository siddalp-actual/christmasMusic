\version "2.20.0"

\header {
  title = "Gaudete"
  subtitle = " " % a bit more space
  % composer = "J. S. Bach."
  % set tagline to false to remove the lilypond composing notice
  tagline = ##f
}

\include "../peteMacs.ly"  % useful functions

timeAndKey = \key g \minor \time 4/4

soprano = \new Voice = "sopranovoice" {
    \relative c'' {
        \voiceOne
        \partial 2 g2 | g2 f2 | g4 a4 bes2 | bes4 a2 g4 | f2 f2 |
        f2 g2 | a2. g4 | f2 g4 a4~ | a4 g4 f2 | g2 \bar "|."
    }
}

alto = \relative c' {
        \partial 2 d2 | d2 d2 | d4 f4 f2 | f4 f2 d4 | d2 d2 |
        d2 d2 | f2. d4 | d2 bes4 f'4~ | f4 c4 d2 | d2 \bar"|."
}

tenor = \relative c' {
        \partial 2 g2 | bes2 a2 | bes4 c4 d2 | d4 c2 bes4 | a2 a2 |
        a2 bes2 | c2. bes4 | a2 g4 f4~ | f4 g4 a2 | g2 \bar "|."
}

bass = \relative c' {
    \voiceTwo
    \partial 2 g2 | g2 d2 | g4 f4 bes,2 | bes4 f'2 g4 | d2 d2 |
    d2 g2 | f2. g4 | d2 e4 f4~ | f4 e4 d2 | g,2 \bar "|."
}

chorusLyrics = \lyrics {
    % -- gives a - which doesn't eat a note, but may be printed
    % _ doesn't give a -, but does eat a note
    % __ prints _ but doesn't eat a note
    Gau -- de -- te, gau -- de -- te Chri -- stus est nat -- us
    ex Ma -- ri -- a vir -- gi -- ne, gau -- de -- te
}

verseTune = \new Voice = "verseSoprano" \relative c'' {
    g4 g4 f4 g4 | bes4 a4 g2 | g4 ees4 d4 ees4 | c2 c2 |
    c4 c4 ees4 c4 | ees4 f4 g2 | bes4 g4 a4 bes4 | g2 g2 \bar "|."
}

vOneLyrics = \lyrics {
    \verse "1"
    Temp -- us ad -- est gra -- ti -- æ, hoc quod opt -- a -- ba -- mus,
    car -- mi -- na læ -- ti -- ti -- æ de -- vo -- te red -- da -- mus
    %the time of grace is come which we en wished for, a song of joy we faithfully
    % give back
}

vTwoLyrics = \lyrics {
    \verse "2"
    De -- us ho -- mo fact -- us est Na -- tu -- ra mir -- an -- te,
    mun -- dus re -- no -- vat -- us est a Christ -- o reg -- nan -- te
}

vThreeLyrics = \lyrics {
    \verse "3"
    Ez -- ech -- i -- e -- lis por -- ta Clau -- sa per -- trans -- it -- ur,
    Un -- de lux est or __ _ ta Sal -- us in -- ven -- i -- tur.
}

vFourLyrics = \lyrics {
    \verse "4"
    Er -- go nos -- tra con -- ti -- o Psall -- at iam in lus -- tro;
    Be -- ne -- di -- cat Dom -- i -- no: Sal -- us Re -- gi nos -- tro
}

pianoupper = \relative c'' {
    \tempo 2 = 102

    \clef treble
    \timeAndKey
    <<
        \voiceOne \soprano
        \voiceTwo \alto
    >>
}

pianolower = \relative c {
    \clef bass
    \timeAndKey
    <<
        \new Voice { \voiceOne \autochange bes \tenor }
        \voiceTwo \bass
    >>
}

\score {
    \new PianoStaff
    <<
        \set PianoStaff.instrumentName = "Piano"
        %\staffName "Piano"
        \new Staff = "up" \pianoupper
        \new Staff = "down" \pianolower
    >>
}

stave =
    #(define-music-function (parser location voice) (ly:music?)
    #{ \new Staff
        \relative c'' {
            \clef treble
            \timeAndKey
            #voice
        }
    #}
 )

sopranostaff = \new Staff
    <<
    \staffName "S"
    \relative c'' {
        \clef treble
        \timeAndKey
        \soprano
    }
    >>

altostaff = %\new stave \alto
    \new Staff
    <<
    \staffName "A"
    \relative c'' {
        \clef treble
        \timeAndKey
        \alto
    }
    >>

tenorstaff = \new Staff
    <<
    \staffName "T"
    \relative c'' {
        \clef "G_8"
        \timeAndKey
        \tenor
    }
    >>

bassstaff = \new Staff
    <<
    \staffName "B"
    \relative c'' {
        \clef bass
        \timeAndKey
        \bass
    }
    >>

\score {
    \new ChoirStaff
    <<
        \sopranostaff
        \new Lyrics \lyricsto "sopranovoice" \chorusLyrics
        \altostaff
        \tenorstaff
        \new Lyrics \lyricsto "sopranovoice" \chorusLyrics
        \bassstaff
    >>
}

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
%}
        \tempo 2 = 102}
}
%{
%}
