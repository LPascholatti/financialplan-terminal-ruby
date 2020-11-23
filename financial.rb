require 'date'
require 'tty-box'


BEGIN {
    require 'colorized_string'
    puts ColorizedString["\nThis program will show your financial plan for this month \u{1F4B0}... \u{1F4B6}"].colorize(:red)
    sleep 2
}

# Variables Questionaire

print TTY::Box.frame "Your Own Financial Plan!"

puts "Hi, I am your financial calculator, I am here to help you save money and have a more sustainable and healthy financial life.\nFirst of all, what is your full name? (Type)"
sleep 2
name = gets
print "\nHi ", name, "Thank you. I will guide through your financial plan.\n"
puts "\nNow, we have a few questions to ask you.\n"
sleep 3
puts ColorizedString["-Question 1:"].colorize(:blue)
sleep 3
puts "What was this month's salary?\n-Type number:"
salary = gets.to_i
sleep 2 
puts ColorizedString["-Question 2:"].colorize(:blue)
sleep 3
puts "What are your costs of living this month? (rent, food, taxes, phone, insurance)\n-Type number:"
living = gets.to_i
sleep 3
puts ColorizedString["-Question 3:"].colorize(:blue)
sleep 3
puts "How much money do you want to save this month? \n Advise: try to save at least a 100 euros for optimal savings\n-Type number:"
savings = gets.to_i
sleep 3
puts ColorizedString["-Question 4:"].colorize(:blue)
sleep 3
puts "Do you have expenses with studies/books (or other recurrent expense)?\nAdvise: Always spend with studies and books \n-Type number:"
studies = gets.to_i
sleep 3
puts ColorizedString["-Question 5:"].colorize(:blue)
sleep 3
print TTY::Box.frame "Do Not Use Credit Cards!"
puts ColorizedString["Attention! For a healthy financial life, it's highly advisable not to use credit cards!"].colorize(:red)
sleep 5
puts "Do you have expenses with credit cards to be payed? (no one is perfect after all...)\n-Type number:"
cc = gets.to_i
sleep 3
puts ColorizedString["-Question 6:"].colorize(:blue)
sleep 3
puts "Do you have any additional income?\n-Type number:"
addincome = gets.to_i
sleep 3
puts ColorizedString["-Question 7:\n"].colorize(:blue)
sleep 3
print TTY::Box.frame "Accept Your Addictions! They are expensive!"
puts ColorizedString["Attention! For a healthy financial life, you should accept your addictions and recurrent expenses!\n You should pay attention and save money with that! Seek for medical help if needed!\n"].colorize(:red)
sleep 5
puts "Do you have any recurrent expenses, coffee, drinks, shopping, gambling, weed or medicine that you use?\n (everyone has his/her own addictions, respect and financial consideration is needed)\n-Type number:"
addiction = gets.to_i
sleep 3
puts ColorizedString["-Question 8:"].colorize(:blue)
sleep 3
puts "Have you done any purchases lately?\n-Type number:"
purchase = gets.to_i
sleep 3

expenses = living + savings + studies 

rest = addincome + salary - expenses

debt = cc + purchase + addiction 

left = rest - debt

date = DateTime.now 

print TTY::Box.frame "Result!"

puts ColorizedString["\nPay attention! Here's your financial plan:"].colorize(:blue)
sleep 3
print "Your month expenses will be in total \u{1F4B8}: ", expenses.round(2), " euros \u{1F4B6} \n"
sleep 3
puts ColorizedString["Next:"].colorize(:red)
print "There will be left: ", rest.round(2), " euros \u{1F4B6} \n"
sleep 3
puts ColorizedString["However, you still have a few debts to pay:"].colorize(:yellow)
sleep 3
print "You should save from your the remaining income a considerable amount to pay debts, which means your Credit Card \u{1F4B3}, personal addictions\u{1F331} and purchases \u{1F913}: ", debt.round(2), " euros \u{1F4B6} \n"
sleep 3
puts ColorizedString["\nFor general expenses:"].colorize(:yellow)
sleep 3
print TTY::Box.frame "\nYou will have left: ", left.round(2)," euros \u{1F4B6}\n", "\nToday is: ", date, "\n\n"
sleep 5

END {
    puts "This was your financial plan.\nYou still have left: ", left.round(2), "euros \u{1F4B6}", "\nPossible excessive expenses are addictions\u{1F331}, Food/Drinks and unexpected subscriptions or debts until next salary."
    sleep 4
    puts("A result.txt file will being generated with the results above!")
    sleep 4
    puts ColorizedString["\nRemember, spend your money wisely!\u{1F4B6}\n"].colorize(:blue)

    File.open('result.txt', 'w') { |f| f.write "Name:#{name}\n
    Result:\n\n#{Time.now} - User logged in\n
    Your month expenses will be in total \u{1F4B8}:#{expenses.round(2)}, euros \u{1F4B6}\n
    There will be left:#{rest.round(2)} euros \u{1F4B6}\n
    However, you still have a few debts to pay.\n
    You should save from your the remaining income a considerable amount to pay debts, which means your Credit Card \u{1F4B3}, personal addictions\u{1F331} and purchases \u{1F913}:#{debt.round(2)} euros \u{1F4B6}\n
    \nFor general expenses.You will have left:#{left.round(2)} euros \u{1F4B6}\n
    Today is:#{date}\n" }
}

