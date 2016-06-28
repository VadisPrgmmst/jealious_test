# coding: utf-8

class TestResultPrinter

  attr_accessor :results

  def initialize
    current_path = File.dirname(__FILE__)
    abort "Файл не найден" unless File.exist?(current_path + "/data/results.txt")
    @results = File.readlines(current_path + "/data/results.txt")
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