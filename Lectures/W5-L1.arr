use context dcic2024

include csv
include data-source



voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

voter-data


filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length()

voter-data.row-n(3)["Party"]

order-by(count(voter-data, "Party"), "count", false)





