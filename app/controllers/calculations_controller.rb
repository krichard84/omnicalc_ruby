class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length

    @occurrences = @text.split.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    term_months = @years * 12
    new_apr = @apr * 1/100
    principal_month = @principal / term_months
    interest_term = @principal * new_apr
    interest_month = interest_term / term_months

    @monthly_payment = principal_month + interest_month

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    
    startt = @starting.to_f
    endt = @ending.to_f
    
    start_min=startt * 1/60
    end_min=endt * 1/60
    
    @minutes = end_min - start_min
    
    start_hr=startt * 1/3600
    end_hr=endt * 1/3600
    
    @hours = end_hr - start_hr
    
    start_day=start_hr * 1/24
    end_day=end_hr * 1/24
  
    @days = end_day - start_day
    
    start_week=start_day * 1/7
    end_week=end_day * 1/7
    
    @weeks = end_week - start_week
    
    start_year=start_week * 1/52
    end_year=end_week * 1/52
    
    @years = end_year - start_year

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

      sorted = @numbers.sort
      len = sorted.length
      
    @median = (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0

    @sum = @numbers.sum

      sum_calc = @sum.to_f
      count_calc = @count.to_f

    @mean = sum_calc / count_calc
    
    sample = @numbers
    xbar = @mean
    variance_differential = []
    
    sample.each do |num1|
    number_less_xbar = num1 - xbar
    variance_differential.push(number_less_xbar)
    end
    
    squared_results = []
    
    variance_differential.each do |num2|
    square = num2 * num2
    squared_results.push(square)
    end
    
    results_sum = squared_results.sum
    
    sample_size = @count - 1
    
    @variance = results_sum / sample_size

    @standard_deviation = Math.sqrt(@variance)

    hash = Hash.new(0)
    @numbers.each do |i|
      hash[i]+=1
    end
    
    mode_max = hash.max
    
    @mode = mode_max

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end

  