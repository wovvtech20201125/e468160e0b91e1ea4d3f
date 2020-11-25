class Api::SudokuController < ApplicationController
  skip_before_action :verify_authenticity_token
  def solve_puzzle
    result = SudokuSolver.solve(params[:data])
  end
end