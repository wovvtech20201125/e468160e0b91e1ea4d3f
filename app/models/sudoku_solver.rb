class SudokuSolver
  VALID_VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  def self.solve(unsolved_data)
    @result = unsolved_data
    build_hash(@result)
    [0..9].each do |row_index|
      [0..9].each do |column_index|
        next if @result[row_index][column_index].present?
          value_set = false
          values = VALID_VALUES - @sudoku_hash
          while value_set == true
            @result[row_index][column_index] = values.first
            if column_contains?(@result, column_index, values.first)
              values.delete(values.first)
              @result[row_index][column_index] = nil
            end
              build_hash(@result)
          end
      end
    end
      
  end

  def self.build_hash(sudoku)
    @sudoku_hash =  sudoku.each_with_object({}).with_index do | (arr,hash), index|
      hash[index] = arr.compact
    end
  end

  def self.column_contains?(sudoku, column_index, value)
    [0..9].each do |row_index|
      return false if sudoku[row_index][column_index] == value
    end
    true
  end

  def self.row_contains?(row_index, value)
    [0..9].each do |column_index|
      return false if sudoku[row_index][column_index] == value
    end
    true
  end
end