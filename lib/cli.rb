class CLI
    attr_accessor :user                 # creating accessor for the user variable
    
    def run
        User.seed                   # seed user data  
        # system('clear')           # clear terminal
        login_or_signup             # login or signup
        greet_user
        menu
        # if @user                        # check if user is logged in
        #     Scraper.scraping(input)               #scrape information
        #     while 
        #         menu != "exit"
        #     end
        # end
        end_program
    end
 
    def login_or_signup
        response = ''
        # while response not equal login and signup
        while response != 'login' && response != 'signup'                       
            puts "Do you want to login or signup? Type 'login' or 'signup'"
            response = gets.chomp.downcase
        end

        if response == 'login'
            login
        else 
            signup
        end
    end

    def signup
        puts " Let's go ahead and signup"       # Prompts the user to sign up
        puts " Enter your username: "           # Asks the user to enter a username
        username = gets.chomp                   # Asks the user to enter a password
        puts " Enter your password: "
        password = gets.chomp                   # creating new user
        @user = User.new(username, password)    # Creates a new user with the provided username and password
        login                                   # calling the login method after the signup process
    end

    def login
        authenticated = false
        while authenticated != true
            puts "please login"
            puts "> what is your username"
            username = gets.chomp.downcase
            puts "> what is your password"
            password = gets.chomp                                                   # authenticating user
            currentUser = Auth.authenticate_user(User.all, username, password)      # authenticating user using the Auth module and passing the all users, username, and password
                if currentUser
                    puts "login successful"
                    authenticated = true
                    @user = currentUser                                                 # setting the user variable to the authenticated user
                    greet_user
                else 
                    puts "please try again, login failed"
                end
            
        end
    end

    # def greeting
    #  puts "Welcome #{@user.username} to etsy item finder"
    # end

    def greet_user                                      # Displays a greeting message when the program starts
        puts "Welcome #{@user.username}"
       end
 
    def menu
     #asks the user which one do they want
     puts "What are you looking for today?"
     input = gets.chomp
     choose_option(input)
     return input 
    end
 
 
    def choose_option(input)
        case input
            when input
                puts "Searching for #{input}"
                Scraper.scraping(input)               #scrape information
            else
                puts "Invalid selection, please try again."
            
        end
    end

    def end_program
        puts "See you next time #{@user.username}!"
       end
end