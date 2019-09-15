class ScopeGate < Struct.new(:statement, :scope)
  def to_s
    "<scope-gate>-#{scope} { #{statement} }"
  end

  def inspect
    "#{self}"
  end

  def reduce(environment)
    if statement.reducible?
      # Entering new scope
      environment = environment.merge(scope_list: updated_scope_list(environment))
      expression, environment = statement.reduce(environment)
      [ScopeGate.new(expression, scope), environment]
    else
      # Exiting scope
      environment.merge(scope_list: environment[:scope_list].shift)
      environment.delete(scope)
      [DoNothing.new, environment]
    end
  end

  def reducible?
    true
  end

  private

    def updated_scope_list(environment)
      Array(environment[:scope_list]).push(scope)
    end
end
