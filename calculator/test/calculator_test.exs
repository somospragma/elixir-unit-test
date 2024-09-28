defmodule CalculatorTest do
  use ExUnit.Case

  setup_all do
    {:ok, content: {:error, "No hay argumentos que operar"}}
  end

  describe "SuccessFul response" do
    test "It should return a successful response from sum operation" do
      assert Calculator.check_type_of_operation(:sum, [1,2,3]) == {:ok, 6}
    end

    test "It should return a successful response from sub operation" do
      assert Calculator.check_type_of_operation(:sub, [5,2,1]) == {:ok, 2}
    end

    test "It should return a successful response from mul operation" do
      assert Calculator.check_type_of_operation(:mul, [3,4,5]) == {:ok, 60}
    end

    test "It should return a successful response from div operation" do
      assert Calculator.check_type_of_operation(:div, [20,2,5]) == {:ok, 2}
    end

    test "It should return a successful response from sqrt operation" do
      assert Calculator.check_type_of_operation(:sqrt, [4]) == {:ok, 2}
    end

    test "It should return a successful response from pow operation" do
      assert Calculator.check_type_of_operation(:pow, [3, 3]) == {:ok, 27}
    end

    test "It should return a successful response from cos operation" do
      assert Calculator.check_type_of_operation(:cos, [0]) == {:ok, 1}
    end

    test "It should return a successful response from sin operation" do
      assert Calculator.check_type_of_operation(:sin, [0]) == {:ok, 0}
    end
  end

  describe "Error response" do

    test "It should return an error response from sum operation because there are not params", error do
      assert Calculator.check_type_of_operation(:sum, []) == error[:content]
    end

    test "It should return an error response from sub operation because there are not params", error do
      assert Calculator.check_type_of_operation(:sub, []) == error[:content]
    end

    test "It should return an error response from mul operation because there are not params", error do
      assert Calculator.check_type_of_operation(:mul, []) == error[:content]
    end

    test "It should return an error response from div operation because there are not params", error do
      assert Calculator.check_type_of_operation(:div, []) == error[:content]
    end

    test "It should return an error response from div operation because there is a zero as param" do
      assert Calculator.check_type_of_operation(:div, [12, 0]) == {:error, "No se puede dividir por 0"}
    end

    test "It should return an error response from sqrt operation because there are not params" do
      assert Calculator.check_type_of_operation(:sqrt, []) == {:error, "No hay argumentos que operar o hay más de 1 argumento"}
    end

    test "It should return an error response from pow operation because there are not params" do
      assert Calculator.check_type_of_operation(:pow, []) == {:error, "No hay argumentos que operar o hay más de 2 argumentos"}
    end

    test "It should return an error response from cos operation because there are not params" do
      assert Calculator.check_type_of_operation(:cos, []) == {:error, "No hay argumentos que operar o hay más de 1 argumento"}
    end

    test "It should return an error response from sin operation because there are not params" do
      assert Calculator.check_type_of_operation(:sin, []) == {:error, "No hay argumentos que operar o hay más de 1 argumento"}
    end

    test "It should return an error response because operation isn't as option" do
      assert_raise(RuntimeError,  "Invalid operation type", fn -> Calculator.check_type_of_operation(:tan, []) end)
    end
  end
end
