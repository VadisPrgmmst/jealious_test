# coding: utf-8

require_relative "test"
require_relative "test_result_printer"

test = Test.new
test_result_printer = TestResultPrinter.new

# первый аргумент командной строки - имя пользователя, проходящего тест или "-v"
name = ARGV[0]
name = "Таинственная Персона" if name == nil
if name == "-v"
  puts test.version
  exit
end

puts test.version
puts "Добрый день, #{name}! Ответьте пожалуйста честно на несколько вопросов, чтобы узнать кое-что о себе.\n\n"

test.pass_test
test_result_printer.print_result(test, name)
