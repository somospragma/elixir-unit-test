#
defmodule Calculator do

  alias OperationType

  def check_type_of_operation(type, params) do
    cond do
      type == :sum -> OperationType.do_sum_operation(params)
      type == :sub -> OperationType.do_sub_operation(params)
      type == :mul -> OperationType.do_mul_operation(params)
      type == :div -> OperationType.do_div_operation(params)
      type == :pow -> OperationType.do_pow_operation(params)
      type == :sqrt -> OperationType.do_sqrt_operation(params)
      type == :cos -> OperationType.do_cos_operation(params)
      type == :sin -> OperationType.do_sin_operation(params)
      true -> raise "Invalid operation type"
    end
  end
end
