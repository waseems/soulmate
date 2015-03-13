# coding: utf-8

module Soulmate
  module Helpers

    def prefixes_for_phrase(phrase)
      words = normalize(phrase).split(' ').reject do |w|
        Soulmate.stop_words.include?(w)
      end
      words.map do |w|
        (Soulmate.min_complete-1..[w.length, Soulmate.max_complete].min-1).map{ |l| w[0..l] }
      end.flatten.uniq
    end

    def normalize(str)
      # treat these as word separators
      seps = /[@]/      
      # Letter, Mark, Number, Connector_Punctuation (Chinese, Japanese, etc.)
      str.downcase.gsub(seps, ' ').gsub(/[^\p{Word}\ ]/i, '').strip
    end

  end
end
