
# Did someone say Fun Friday? I think so! 
# What better way to start then searching the web for an API 
# that you can call through a Ruby App (no need for rails). 
# Remember to use the gem 'httparty' to make these calls.
# This app can be as large or small as you want, just get a good grasp of how the ol' API magic works!




#I am using the API NumbersAPI to display interesting fact about the required number

#require httparty
require "httparty"
#require httparty
require "json"

# response = HTTParty.get("https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol")
#This is how we must call the link from httparty.

    class NumberModel 
        def trivia(number)
            trivia = HTTParty.get("http://numbersapi.com/#{number}/trivia")
        end

        def year(number)
            year =  HTTParty.get("http://numbersapi.com/#{number}/year")
        end

        def date(number)
            date = HTTParty.get("http://numbersapi.com/#{number}/date")
        end

        def math(number)
            math = HTTParty.get("http://numbersapi.com/#{number}/math")
        end

    end

    class NumberView
        def greeting
            puts "Welcome to the amazing world of numbers!"
        end

        def require_number
            puts "Please, give us a number"
        end
        
        def given_number
            gets.chomp.to_i
        end
        def menu
            puts "Please, choose a category"
            puts "1. Trivia"
            puts "2. Year"
            puts "3. Date"
            puts "4. Math"
            puts "5. Exit the game" 
        end

        def choice
            gets.chomp.to_i    
        end

        def wrong_choice
            puts "Sorry, input invalid"
        end

        def prefact(number)
            puts "Here is your interesting fact about number #{number}"
        end

        def bye
            puts "See you!"
        end
    end

    class NumberController
        def initialize
            @model = NumberModel.new
            @view = NumberView.new
        end

        def run
            @view.greeting
            @view.require_number
            number = @view.given_number
            @view.menu
            choice = @view.choice
            while choice != 5                
                if choice == 1
                    @view.prefact(number)
                    puts @model.trivia(number)
                elsif choice == 2
                    @view.prefact(number)
                    puts @model.year(number)
                elsif choice == 3
                    @view.prefact(number)
                    puts @model.date(number)
                elsif choice == 4
                    @view.prefact(number)
                    puts @model.math(number)
                else
                    @view.wrong_choice
                end
                @view.menu
                choice = @view.choice
            end
            @view.bye
        end
    end

    numbergame = NumberController.new
    p numbergame.run
            


