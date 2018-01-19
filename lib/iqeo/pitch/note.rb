
module Iqeo
  module Pitch

    REF_FREQ = 440.0
    REF_INDEX  = 57
    NOTE_NAMES = %w[ C C#/Db D D#/Eb E F F#/Gb G G#/Ab A A#/Bb B ]

    Note = Struct.new( :freq, :pitch, :cents, :octave, :name ) do
      def fullname
        "#{name}#{octave}"
      end
    end

    def self.note freq
      index = ( Math.log2( freq / REF_FREQ ) * 12.0 ).round + REF_INDEX
      Note.new(
        freq,
        pitch  = 2 ** ( ( index - REF_INDEX ) / 12.0 ) * REF_FREQ,
        cents  = ( Math.log2( freq / pitch ) * 1200 ).round,
        octave = index / NOTE_NAMES.count,
        name   = NOTE_NAMES[index % NOTE_NAMES.count]
      )
    end

  end
end

Iqeo::Pitch.note(119) # => #<struct Iqeo::Pitch::Note freq=119, pitch=116.54094037952248, cents=36, octave=2, name="A#/Bb">
Iqeo::Pitch::Note.class  # => Class


