class Puzzle
  def get_odds_and_evens(numbers_to_evaluate)
    list_of_odds_numbers = []
    list_of_even_numbers = []
    numbers_to_evaluate.each {|index| index.odd? ? list_of_odds_numbers << index : list_of_even_numbers << index}
    list_of_odds_numbers.length == 1 ? list_of_odds_numbers[0] : list_of_even_numbers[0]
    outliner_even = list_of_even_numbers.length
    outliner_odd = list_of_odds_numbers.length
    if outliner_even > outliner_odd
      return list_of_odds_numbers[0]
    else
      return list_of_even_numbers[0]
    end
  end
end