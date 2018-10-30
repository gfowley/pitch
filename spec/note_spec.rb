require "pitch"

RSpec.describe Pitch::Note do

  context "has attributes" do

    before(:all) do
      @note = Pitch::Note.new(999.0,1000.0,10,3,"X")
    end

    it( "freq"     ) { expect( @note.freq     ).to eq 999.0  }
    it( "pitch"    ) { expect( @note.pitch    ).to eq 1000.0 }
    it( "cents"    ) { expect( @note.cents    ).to eq 10     }
    it( "octave"   ) { expect( @note.octave   ).to eq 3      }
    it( "name"     ) { expect( @note.name     ).to eq "X"    }
    it( "fullname" ) { expect( @note.fullname ).to eq "X3"   }

  end


  context "calculates note from frequency" do

    context "exact 440.0Hz A4" do

      before(:all) do
        @note = Pitch.note(440.0)
      end

      it( "freq"     ) { expect( @note.freq     ).to eq 440.0 }
      it( "pitch"    ) { expect( @note.pitch    ).to eq 440.0 }
      it( "cents"    ) { expect( @note.cents    ).to eq 0     }
      it( "octave"   ) { expect( @note.octave   ).to eq 4     }
      it( "name"     ) { expect( @note.name     ).to eq "A"   }
      it( "fullname" ) { expect( @note.fullname ).to eq "A4"  }

    end

    context "very high detuned 265.17Hz C4" do

      before(:all) do
        @note = Pitch.note(269.23)
      end

      it( "freq"     ) { expect( @note.freq     ).to eq 269.23            }
      it( "pitch"    ) { expect( @note.pitch    ).to eq 261.6255653005986 }
      it( "cents"    ) { expect( @note.cents    ).to eq 50                }
      it( "octave"   ) { expect( @note.octave   ).to eq 4                 }
      it( "name"     ) { expect( @note.name     ).to eq "C"               }
      it( "fullname" ) { expect( @note.fullname ).to eq "C4"              }

    end

    context "very low detuned 761.72Hz G5" do

      before(:all) do
        @note = Pitch.note(761.72)
      end

      it( "freq"     ) { expect( @note.freq     ).to eq 761.72            }
      it( "pitch"    ) { expect( @note.pitch    ).to eq 783.9908719634985 }
      it( "cents"    ) { expect( @note.cents    ).to eq -50               }
      it( "octave"   ) { expect( @note.octave   ).to eq 5                 }
      it( "name"     ) { expect( @note.name     ).to eq "G"               }
      it( "fullname" ) { expect( @note.fullname ).to eq "G5"              }

    end
  end
  
end
