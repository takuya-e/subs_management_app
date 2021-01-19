class ImportCsv

  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      Subscription.create!(
        service_name: row["service_name"], 
        genre: row["genre"],
        contractcycle_month: row["contractcycle_month"],
        contractcycle_year: row["contractcycle_year"],
        monthly_fee: row["monthly_fee"],
        annual_fee: row["annual_fee"]
      )
    end
  end
  
end