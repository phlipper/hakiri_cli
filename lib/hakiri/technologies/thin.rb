class Hakiri::Thin < Hakiri::Technology
  def initialize(command = '')
    super

    @name = 'Thin'
  end

  def version
    begin
      output = (@command.empty?) ? `thin -v 2>&1` : `#{@command} 2>&1`
      @default_regexp.match(output)[0]
    rescue Exception => e
      puts_error(e, output)
      nil
    end
  end
end