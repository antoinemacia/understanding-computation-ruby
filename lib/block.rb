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
    [ScopeGate.new(proc { expression }.call, scope), environment]
  end

  private

  def scope
    object_id.to_s.to_sym
  end
end
