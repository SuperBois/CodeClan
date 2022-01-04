insert into Ranks(rank_name, rank_XP)  values 
	('bronze',0),
	('silver',1000),
	('gold',3000),
	('platinum',7500);

insert into Roles(role_name, role_description) values 
	('Novice','A new user to the platform who can enroll in courses and follow discussions.'),
	('Competant','A user who has participated in at least 3 competitions and has one silver skill badge'),
    ('Proficient','A user who has participated in at least 5 competitions and has one gold skill badge'),
    ('Expert','A user who has participated in at least 10 competitions and has one platinum skill badge'),
    ('Organizer','A user who can organize competitions for other users to participate and select judges for it.'),
    ('Instructor','A user who two gold skill badges and can create courses and skill paths for other users. Instructor can apply to become an organizer'),
    ('Judge', 'A user who is responsible for ranking the submissions in a competition. Judges must have two gold badges.');

insert into Users(user_id, user_name, user_email, fname, lname, XP, gender, country, rank_id, role_id) values
	(1, 'Sheraz', 	'sheraz@gmail.com', 'Sheraz', 'Hussain', 400, 'M', 'Pakistan', 1, 2),
    (2, 'Mustafa', 'mustafa@gmail.com', 'Muhammad', 'Mustafa', 200, 'M', 'Pakistan', 1, 2),
    (3, 'Zafar', 	'zafar@gmail.com', 	'Muhammad', 'Zafar', 800, 'M', 'Pakistan', 1, 2),
    (4, 'Danish', 	'danish@gmail.com', 'Muhammad', 'Danish', 300, 'M', 'Pakistan', 1, 2),
    (5, 'Taha', 	'taha@gmail.com', 'Taha', 'Naveed', 900, 'M', 'Pakistan', 1, 2),
    (6, 'Khubaib', 'khubaib@gmail.com', 'Khubaib', 'Ahmad', 980, 'M', 'Pakistan', 1, 2),
    (7, 'Awan', 	'awan@gmail.com', 'Abdullah', 'Awan', 700, 'M', 'Pakistan', 1, 2),
    (8, 'Dar', 	'dar@gmail.com', 'Ali', 'Dar', 650, 'M', 'Pakistan', 1, 2),
    (9, 'Husnain', 'husnain@gmail.com', 'Husnain', 'Mehdi', 800, 'M', 'Pakistan', 1, 2),
	(10, 'AliUsman', 'aliusman@gmail.com', 'Ali', 'Usman', 500, 'M', 'Pakistan', 1, 2);
    
Insert into Achievements (achievement_id, user_id, achievement_title) values 
	(1, 1, 'Gold Programmer'),
    (2, 2, 'Silver Programmer'),
    (3, 3, 'Completed FOP'),
    (4, 3, 'Completed OOP'),
    (5, 3, 'Completed DBS'),
    (6, 3, 'Comleted DSA');
    
Insert into skill_path(path_id, skill_name) values
    (1, 'Database Management System'),
    (2, 'Data Structures and Algorithms'),
    (3, 'Object Oriented Programming'),
    (4, 'Fundamentals of Programming'),
    (5, 'Basics of Python'),
    (6, 'Basic Electronics');
    
Insert into skillpath_enrollment(user_id, path_id) values
	(1,1),
    (1,2),
    (3,1),
    (3,2),
    (3,3),
    (3,4),
    (3,5);

Insert into Instructor(instructor_id, instructor_name, linkedin_link) values
	(1, 'Mosh', 'mosh@linkedin.com'),
    (2, 'Danish', 'daneesh@linkedin.com'),
    (3, 'Dr Taha', 'taha@linkedin.com'),
    (4, 'Shah Khalid', 'shah@linkedin.com'),
    (5, 'Habeel Ahmad', 'habeel@linkedin.com');
    
Insert into Course(course_name, course_description, instructor_id, skill_path_id) values
	('Transistors', 'A beginner friendly introduction to Transistors.', 5, 6),
    ('Diode', 'A beginner friendly introduction to Diodes.', 5, 6),
    ('ERD', 'A beginner friendly introduction to ERD.', 5, 6),
    ('Electric Circuits', 'A beginner friendly introduction to Electric Circuits.', 3, 6),
    ('Algorithms', 'A beginner friendly introduction to algorithms.', 2, 2),
    ('Time Complexity', 'A beginner friendly introduction to Time Complexity.', 2, 2),
    ('Python Dictionaries', 'A beginner friendly introduction to Python Dictionaries.', 1, 5);

Insert into Problems(problem_id, problem_name,problem_text, difficulty_level, category, acceptance_rate) values
	(1, 'sum_of_2', 'Write a progam that takes two numbers from the user and prints their sum', 'Very Easy', 'Basic', 95),
    (2, 'sum_dif_prod','Write a progam that takes five numbers from the user and prints their sum, difference and product.', 'Easy', 'Basic', 94),
    (3, 'factorial','Write a progam that takes a number from the user and prints the factorial of every number less than that number.', 'Easy', 'Basic', 87),
    (4, 'fibonacci','Write a progam that can print the first n numbers of fibonnaci sequence', 'Easy', 'Basic', 92),
    (5, 'array_search','Write a progam that creates an array of 50 elements and then prompts the user to enter a number and searches for that number', 'Easy', 'Basic', 90);


Insert into Question_threads(thread_id, topic, statement, creator_user_id, views, responses) values 
	(1, 'Iterating over arrays in Python 3', 'How can I loop through all the entries in an array using JavaScript?

I thought it was something like this:

forEach(instance in theArray)

Where theArray is my array, but this seems to be incorrect.
', 4, 20, 2),
	(2, 'Concatenating two lists in python' ,'

How do I concatenate two lists in Python?

Example:

listone = [1, 2, 3]
listtwo = [4, 5, 6]

Expected outcome:

>>> joinedlist
[1, 2, 3, 4, 5, 6]
', 1, 20, 3),
	(3, 'How to print without a newline or space' ,'I\'d like to do it in Python. What I\'d like to do in this example in C:

#include <stdio.h>

int main() {
    int i;
    for (i=0; i<10; i++) printf(".");
    return 0;
}

Output:

..........', 7, 13, 2);

Insert into Message (message_id, message, from_user_id) values
	(1, "Brother, this is very hard question :'(",2),
    (2, "Brother, tell me when you know the answer.",7),
    (3, "Wattt, You can't do something this simple :|, I am a prof I will write the answer.",4),
    (4, "In Python a foreach loop is a for loop :), the syntax will be 'for element in thearray:' where 'thearray' is your array.", 9),
    (5, "Use a for loop. Refer to documentation for more information.", 8);

Insert into Reply (thread_id, message_id) values 
	(1, 1),
    (1, 2),
    (1, 3),
    (1, 4);
    
Insert into Answer (thread_id, message_id) values
	(1, 4),
    (1, 5);

Insert into Comments (comment_id, comment_text, user_id, answer_id) values
	(1, "Great Answer", 1, 4),
    (2, "Your Answer is a bit rude :))", 6, 5);
