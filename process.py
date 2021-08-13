log_file = open("um-server-01.txt") # This opens the text file and saves it to a variable called 'log_file'

def sales_reports(log_file): # This is the declaration of a function called sales_reports that takes in a single parameter (also called log_file, but that's okay)
    for line in log_file: # This is a for loop that will read every line of whatever argument is passed into the function. Every separate line of the argument will now be known as 'line'
        line = line.rstrip() # This will remove any trailing blank characters on the right side of this string (which is 'line') and then it will reassign 'line' to be the cleaned up version.
        day = line[0:3] # This will create a shallow copy of the first 3 characters of 'line' and save them to a new variable called 'day'
        if day == "Mon": # If the value of 'day' is 'Tue', the statements in the code block will run (except now it's 'Mon')
            print(line) # This prints the value of 'line' to the console. It will be the cleaned up version that was created in line 6 of the code.


sales_reports(log_file) # This runs the above function, passing in the file that was opened in line 1.

# In process.py, write another function that prints out all the melon orders that delivered over 10 melons.

def more_than_10_melons(monkey):
    for line in monkey:
        line = line.strip().split(' ')
        if int(line[2]) > 10:
            print(' '.join(line))


more_than_10_melons(log_file)
