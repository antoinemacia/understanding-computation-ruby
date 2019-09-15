class DoNothing
  def to_s
    'do-nothing'
  end

  def inspect
    "#{self}"
  end

  def ==(pther_statement)
    other_statement.instance_of?(DoNothing)
  end

  def reducible?
    false
  end
end
