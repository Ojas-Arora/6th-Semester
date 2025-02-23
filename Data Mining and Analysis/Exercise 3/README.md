Question 1: You are required to write a program to sort the (name, age, height) tuples by ascending order where name is string, age and height are numbers. The tuples are input by console. The sort criteria is: 1: Sort based on name; 2: Then sort based on age; 3: Then sort by score. The priority is that name > age > score.
If the following tuples are given as input to the program:
Tom,19,80
John,20,90
Jony,17,91
Jony,17,93
Json,21,85
Then, the output of the program should be:
[('John', '20', '90'), ('Jony', '17', '91'), ('Jony', '17', '93'), ('Json', '21', '85'), ('Tom', '19', '80')]


Question 2: Calculate Word Frequencies. Take a set of sentences in a string as an input. Count each unique occurrence of a word and calculate frequency of occurrence and store in a dictionary. Produce a frequency table.
Hint1: Iterate through the string, placing the words into a dict. The first time a word is seen, the frequency is 1. Each time the word is seen again, increment the frequency. 
Hint2: Similar program given in Tuple Dictionary Notebook.




Question 3: Result Calculation. Create a dictionary and a list like following.
Student = { 'UE183001': 'Avish', 'UE183002': 'Bhavya', 'UE183003': 'Tanya' } Add atleast 10 students
Marks = [('UE183001', 'CS', 94 ), ('UE183002', 'CS', 64 ), ('UE183001', 'RV', 94), ('UE183002', 'CS', 74), 
  ('UE183003', 'CS', 64)] Add some more values
Find total marks of each students and display full name of student with total marks secured. This is the basic relational database join algorithm between two tables.




Question 4: A date of the form 8-MAR-85 includes the name of the month, which must be translated to a number. Create a dict suitable for decoding month names to numbers. Create a function which uses string operations to split the date into 3 items using the "-" character. Translate the month, correct the year to include all of the digits.
The function will accept a date in the "dd-MMM-yy" format and respond with a tuple of ( y , m , d ).




Question 5: Dice Odds. There are 36 possible combinations of two dice. A simple pair of loops over range(6)+1 will enumerate all combinations. The sum of the two dice is more interesting than the actual combination. Create a dict of all combinations, using the sum of the two dice as the key. Each value in the dict should be a list of tuples; each tuple has the value of two dice. The general outline is something like the following:
d= {}
Loop with d1 from 1 to 6
    Loop with d2 from 1 to 6
        newTuple ← ( d1, d2 ) # create the tuple
        oldList ← dictionary entry for sum d1+d2
        newList ← oldList + newTuple
        replace entry in dictionary with newList
Loop over all values in the dictionary
print the key and the length of the list
