# coding: utf-8

require_relative "main_logic_test"
require_relative "test_result_printer"

current_path = File.dirname(__FILE__)
abort "Файл не найден" unless File.exist?(current_path + "/data/questions.txt") && File.exist?(current_path + "/data/results.txt")

file_questions = File.readlines(current_path + "/data/questions.txt")
file_results = File.readlines(current_path + "/data/results.txt")

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0]

test = MainLogicTest.new
test_result_printer = TestResultPrinter.new

test.questions = file_questions 
test_result_printer.results = file_results 

name = "Таинственная Персона" if name == nil

if name == "-v"
  puts test.version
  exit
end

puts test.version
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе.\n\n"

test.pass_test
test_result_printer.print_result(test, name)
