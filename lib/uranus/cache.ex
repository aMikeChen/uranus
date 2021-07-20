defmodule Uranus.Cache do
  @callback get_value(key :: String.t) :: any
  @callback set_value(key :: String.t, value :: any, opt :: list(Keywords)) :: {:ok | :error, any}
end
