class FlakeyFinder
  class Example
    def initialize(example)
      @example = example
    end

    def key
      [file_path, line_number].join(":")
    end

    def status
      @example["status"]
    end

    private

    def file_path
      @example["file_path"]
    end

    def line_number
      @example["line_number"]
    end

  end
end