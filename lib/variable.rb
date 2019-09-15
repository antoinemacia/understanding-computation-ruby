class Variable < Struct.new(:name)
  def to_s
    name.to_s
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    environment[name]
  end

  private

  def current_scope(environment)
    Array(environment[:scope_list]).first
  end
end
