module DinnersHelper
    def random_dinners_by_day(meals)
      weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
                  "Saturday", "Sunday"]
      meal_days = []
      iterator = 0;
      meals.each do |m|
       meal_days.push({day: weekdays[iterator], dinner: m})
       iterator += 1
      end
      meal_days
    end

    def week_of
        Date.today.beginning_of_week
    end

    
end
