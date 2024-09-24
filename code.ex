defmodule FoodTruckApi.CSVParser do
  alias NimbleCSV.RFC4180, as: CSV

  def parse_food_trucks(file_path) do
    file_path
    |> File.read!()
    |> CSV.parse_string(headers: false)
    |> Enum.map(&map_to_food_truck/1)
  end

  defp map_to_food_truck([_locationid, applicant, facility_type, _cnn, _loc_desc, address | _]) do
    %{
      applicant: applicant,
      facility_type: facility_type,
      address: address
    }
  end
end
