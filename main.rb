# coding: utf-8

require_relative "lib/test"
require_relative "lib/test_result_printer"

QUESTIONS_FILE_PATH = "#{File.dirname(__FILE__)}/data/questions.txt"
RESULTS_FILE_PATH = "#{File.dirname(__FILE__)}/data/results.txt"

abort "Файл не найден" unless File.exist?(QUESTIONS_FILE_PATH) && File.exist?(RESULTS_FILE_PATH)

test = Test.new QUESTIONS_FILE_PATH
test_result_printer = TestResultPrinter.new RESULTS_FILE_PATH

version = "Тест \"Ревнивы ли вы\". Версия 0.4. (c) 2016 Vadim Galkin\n\n"

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0]
name = "Таинственная Персона" if name == nil
if name == "-v"
  puts version
  exit
end

puts version
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе.\n\n"

test.pass_test
test_result_printer.print_result(test, name)
