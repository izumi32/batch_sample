module Development
  class UsedMemoryReport
    # インスタンスを1つに限定
    include Singleton

    def initialize
      @reports = []
    end

    # メモリ消費量を記録
    def write(label)
      @reports << "used memory: #{label} #{ObjectSpace.memsize_of_all * 0.001 * 0.001} MB"
    end

    # メモリ消費量を出力
    def puts_all
      @reports.each { |report| puts report }
    end
  end
end
