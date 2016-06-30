# coding: utf-8

class TestResultPrinter

  attr_accessor :results

  def initialize(results_file_name)
    current_path = File.dirname(__FILE__)
    abort "Файл не найден" unless File.exist?(current_path + results_file_name)
    @results = File.readlines(current_path + results_file_name)
  end

  def print_result(test, name)
    puts "\n#{name}, Ваш результат теста (ответов 'да' - #{test.yes_answers_count}):\n\n"
    if (test.yes_answers_count >= 10)
      puts @results[0]
    elsif (test.yes_answers_count >=5)
      puts @results[1]
    else
      puts @results[2]
    end
  end
end