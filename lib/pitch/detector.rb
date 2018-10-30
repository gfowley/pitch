
module Pitch

  class Detector

    # count negative zero crossings
    # divide by number of samples

    def self.detect1 samples, rate: 44100
      pairs = samples.each_cons(2)
      negative_zero_cross_count = count_negative_zero_crossings pairs
      freq = Float(rate) * negative_zero_cross_count / samples.count
    end

    # exclude samples from before first and after last negative zero crossing
    # count negative zero crossings ( -1 for extra crossing at end )
    # divide by number of samples between first and last negative zero crossing

    def self.detect2 samples, rate:44100
      pairs = samples.each_cons(2)
      pairs_between_first_and_last_crossings = trim_sample_pairs_to_negative_zero_crossings pairs
      negative_zero_cross_count = count_negative_zero_crossings pairs_between_first_and_last_crossings
      freq = negative_zero_cross_count.zero? ? 0.0 : Float(rate) * ( negative_zero_cross_count -1 ) / ( pairs_between_first_and_last_crossings.count + 1 )
    end

    # count number of samples between negative zero crossings
    # average gap sizes

    def self.detect3 samples, rate:44100
      pairs = samples.each_cons(2)
      periods = pairs.each_with_object([]) do |(previous,current),periods|
        if negative_zero_crossing? previous, current
          periods << 1
          next
        end
        next if periods.empty?
        periods[-1] += 1  # inc current period duration
      end
      periods.pop # last period is incomplete
      return 0.0 if periods.empty?
      average_period = Float(periods.sum) / periods.count
      freq = rate / average_period 
    end

    class << self
      alias_method :detect, :detect3
    end

    def self.count_negative_zero_crossings pairs
      pairs.count do |previous,current|
        negative_zero_crossing? previous, current
      end
    end

    def self.trim_sample_pairs_to_negative_zero_crossings pairs
      pairs_after_first_crossing = pairs.drop_while do |previous,current|
        ! negative_zero_crossing? previous, current
      end
      pairs_between_first_and_last_crossings = pairs_after_first_crossing.reverse_each.drop_while do |previous,current|
        ! negative_zero_crossing? previous, current
      end.reverse_each
    end

    def self.negative_zero_crossing? previous, current
      current < 0 && previous >= 0
    end

    def self.sign n
      n <=> 0
    end

  end

end


