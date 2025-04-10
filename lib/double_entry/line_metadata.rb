module DoubleEntry
  class LineMetadata < ActiveRecord::Base
    class SymbolWrapper
      def self.load(string)
        return unless string
        string.to_sym
      end

      def self.dump(symbol)
        return unless symbol
        symbol.to_s
      end
    end

    belongs_to :line

    if Rails.gem_version >= '7.1.0'
      serialize :key, coder: SymbolWrapper
    else
      serialize :key, SymbolWrapper
    end
  end
end
