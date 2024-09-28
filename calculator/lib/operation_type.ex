defmodule OperationType do
  def do_sum_operation(params) when length(params) == 0,
    do: {:error, "No hay argumentos que operar"}

  def do_sum_operation(params), do: {:ok, Enum.sum(params)}

  def do_sub_operation(params) when length(params) == 0,
    do: {:error, "No hay argumentos que operar"}

  def do_sub_operation([head | tail]), do: {:ok, Enum.reduce(tail, head, &(&2 - &1))}

  def do_mul_operation(params) when length(params) == 0,
    do: {:error, "No hay argumentos que operar"}

  def do_mul_operation([head | tail]), do: {:ok, Enum.reduce(tail, head, &(&1 * &2))}

  def do_div_operation(params) when length(params) == 0,
    do: {:error, "No hay argumentos que operar"}

  def do_div_operation([head | tail]) do
    Enum.find_value(tail, &(&1 == 0))
    |> case do
      nil -> {:ok, Enum.reduce(tail, head, &(&2 / &1))}
      _ -> {:error, "No se puede dividir por 0"}
    end
  end

  def do_sqrt_operation(params) when length(params) == 0 or length(params) > 1,
    do: {:error, "No hay argumentos que operar o hay más de 1 argumento"}

  def do_sqrt_operation([number]), do: {:ok, :math.sqrt(number)}

  def do_pow_operation(params) when length(params) == 0 or length(params) > 2,
    do: {:error, "No hay argumentos que operar o hay más de 2 argumentos"}

  def do_pow_operation([base, exponent]), do: {:ok, :math.pow(base, exponent)}

  def do_cos_operation(params) when length(params) == 0 or length(params) > 1,
    do: {:error, "No hay argumentos que operar o hay más de 1 argumento"}

  def do_cos_operation([number]), do: {:ok, :math.cos(number * :math.pi() / 180)}

  def do_sin_operation(params) when length(params) == 0 or length(params) > 1,
    do: {:error, "No hay argumentos que operar o hay más de 1 argumento"}

  def do_sin_operation([number]), do: {:ok, :math.sin(number * :math.pi() / 180)}
end
