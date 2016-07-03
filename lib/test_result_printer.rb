# coding: utf-8

class TestResultPrinter

  attr_accessor :results

  def initialize(file_path)
    @results = File.readlines(file_path)
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