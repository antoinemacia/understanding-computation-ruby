class Block < Struct.new(:expression)
  def to_s
    "do #{expression} end"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    Proc.new { expression.reducible? ? expression.reduce(environment) : expression }.call
  end
end
