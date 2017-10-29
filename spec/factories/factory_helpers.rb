module FactoryHelpers
  def self.random_time_captured
    start_date = Date.parse("04-02-2017")
    end_date = Date.parse("05-02-2017")

    multiple_of_five = (rand(0..60)/5) * 5

    ([start_date, end_date].sample + rand(5..10).hour + (multiple_of_five.minutes)).to_datetime
  end
end
