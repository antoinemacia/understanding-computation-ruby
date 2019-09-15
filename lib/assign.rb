class Assign < Struct.new(:name, :expression)
  def to_s
    "#{name} = #{expression}"
  end

  def inspect
    "#{self}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(environment)), environment]
    else
      [DoNothing.new, environment.merge(build_assignment(environment))]
    end
  end

  private

    def current_scope(environment)
      Array(environment[:scope_list])
    end

    def build_assignment(environment)
      assignment = { name => expression }
      return assignment if environment.has_key?(name)

      current_scope(environment).reverse.inject(assignment) do |acc, scope|
        return { scope => acc } if environment.has_key?(scope)
        { scope => acc }
      end
    end
end
