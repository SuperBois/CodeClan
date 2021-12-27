insert into Ranks(rank_id, rank_name, rank_XP)  values 
	(1, 'bronze',0),
	(2, 'silver',1000),
	(3, 'gold',3000),
	(4, 'platinum',7500);

insert into Roles(role_id, role_name, role_description) values 
	(1, 'Novice','A new user to the platform who can enroll in courses and follow discussions.'),
	(2, 'Competant','A user who has participated in at least 3 competitions and has one silver skill badge'),
    (3, 'Proficient','A user who has participated in at least 5 competitions and has one gold skill badge'),
    (4, 'Expert','A user who has participated in at least 10 competitions and has one platinum skill badge'),
    (5, 'Organizer','A user who can organize competitions for other users to participate and select judges for it.'),
    (6, 'Instructor','A user who two gold skill badges and can create courses and skill paths for other users. Instructor can apply to become an organizer'),
    (7, 'Judge', 'A user who is responsible for ranking the submissions in a competition. Judges must have two gold badges.');

insert into Users(user_id, user_name, user_email, fname, lname, XP, gender, country, rank_id, role_id) values
	(1, 'Sheraz', 	'sheraz@gmail.com', 'Sheraz', 'Hussain', 400, 'M', 'Pakistan', 1, 2),
    (2, 'Mustafa', 'mustafa@gmail.com', 'Muhammad', 'Mustafa', 200, 'M', 'Pakistan', 1, 2),
    (3, 'Zafar', 	'zafar@gmail.com', 	'Muhammad', 'Zafar', 800, 'M', 'Pakistan', 1, 2),
    (4, 'Danish', 	'danish@gmail.com', 'Muhammad', 'Danish', 300, 'M', 'Pakistan', 1, 2),
    (5, 'Taha', 	'taha@gmail.com', 'Taha', 'Naveed', 900, 'M', 'Pakistan', 1, 2),
    (6, 'Khubaib', 'khubaib@gmail.com', 'Khubaib', 'Ahmad', 980, 'M', 'Pakistan', 1, 2),
    (7, 'Awan', 	'awan@gmail.com', 'Abdullah', 'Awan', 700, 'M', 'Pakistan', 1, 2),
    (8, 'Dar', 	'dar@gmail.com', 'Ali', 'Dar', 650, 'M', 'Pakistan', 1, 2),
    (9, 'Husnain', 'husnain@gmail.com', 'Husnain', 'Mehdi', 800, 'M', 'Pakistan', 1, 2);

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
    (5, 'Basics of Python');
    
Insert into skillpath_enrollment(user_id, path_id) values
	(1,1),
    (1,2),
    (3,1),
    (3,2),
    (3,3),
    (3,4),
    (3,5);

