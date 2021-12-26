CREATE DATABASE if not exists semproject;

USE semproject;

CREATE TABLE Users (
	user_id int NOT NULL AUTO_INCREMENT, 
	user_name varchar(255) NOT NULL, 
	user_email varchar(255) NOT NULL, 
    fname varchar(255) NOT NULL, 
    lname varchar(255) NOT NULL, 
    XP int default 0, 
    DOJ timestamp default current_timestamp(), 
    gender varchar(10), 
    country varchar (255), 
    rank_id int default 0,
    PRIMARY KEY (user_id));


CREATE TABLE Roles (
	role_id int NOT NULL, 
    role_name varchar(255) NOT NULL, 
    role_description text NOT NULL,
    PRIMARY KEY (role_id));

CREATE TABLE Ranks(
	rank_id int NOT NULL AUTO_INCREMENT, 
    rank_name int NOT NULL, 
    rank_description text NOT NULL, 
    role_id INT NOT NULL, 
    XP INT NOT NULL,
    PRIMARY KEY (rank_id),
    FOREIGN KEY (role_id) references Roles(role_id));
    
CREATE TABLE Achievements (
	achievement_id int auto_increment, 
    user_id int NOT NULL, 
    date_achieved datetime default current_timestamp, 
    achievement_title varchar(255) not null,
    primary key (achievement_id),
    foreign key (user_id) references Users(user_id));


CREATE TABLE skill_path(
	path_id int auto_increment, 
    skill_name varchar (255),
    PRIMARY KEY (path_id));
    
CREATE TABLE skillpath_enrollment (
	user_id int NOT NULL, 
    path_id int NOT NULL,
    PRIMARY key (user_id, path_id),
    FOREIGN KEY (user_id) references Users(user_id),
    FOREIGN KEY (path_id) references skill_path(path_id));

CREATE TABLE Instructor(
	instructor_id int NOT NULL, 
    instructor_name VARCHAR (255), 
    linkedin_link varchar (255),
    primary key (instructor_id));

CREATE TABLE Course (
	course_id int NOT NULL, 
    course_name VARCHAR(255) NOT NULL, 
    course_description TEXT NOT NULL, 
    instructor_id int NOT NULL, 
    skill_path_id int NOT NULL, 
    created_on timestamp DEFAULT current_timestamp(),
    primary key (course_id),
    foreign key (instructor_id) references Instructor(instructor_id),
    foreign key (skill_path_id) references skill_path(path_id));


CREATE TABLE Course_enrollment(
	user_id int NOT NULL, 
    course_id int NOT NULL,
    PRIMARY KEY (user_id, course_id),
    FOREIGN KEY (user_id) references Users(user_id),
    FOREIGN KEY (course_id) references Course(course_id));


CREATE TABLE review(
    rating INT NOT NULL, 
    review_text varchar(255) NOT NULL, 
    course_id int NOT NULL, 
    user_id int not null,
    primary key(course_id, user_id),
    foreign key (course_id) references Course(course_id),
    foreign key (user_id) references Users(user_id));


CREATE TABLE Lesson (
	lesson_id int NOT NULL auto_increment, 
    lesson_title VARCHAR (255) NOT NULL, 
    lesson_description TEXT NOT NULL, 
    course_id INT NOT NULL,
    PRIMARY KEY (lesson_id),
    FOREIGN KEY (course_id) references Course(course_id));

CREATE TABLE Assignment(
	assignment_id int not null auto_increment, 
    assignment_title varchar(255) not null,
    primary key (assignment_id));

CREATE TABLE Course_assignments(
	course_id int not null, 
    assignment_id int not null, 
    assignment_number int not null,
    primary key(course_id, assignment_id),
    foreign key (course_id) references Course(course_id),
    foreign key (assignment_id) references Assignment(assignment_id));
    
CREATE TABLE assignment_question(
	question_id int not null,
	assignment_id INT NOT NULL, 
    question_num INT NOT NULL, 
    question_statement TEXT NOT NULL,
    PRIMARY KEY (question_id),
    foreign key (assignment_id) references Assignment(assignment_id));


CREATE TABLE Languages(
	lang_id int not null auto_increment, 
    lang_name varchar(255) not null, 
    developer_name varchar (255) not null, 
    release_year int not null, 
    PRIMARY KEY (lang_id));

CREATE TABLE solution_question (
	solution_id int not null auto_increment, 
    question_id int not null, 
    solution text not null,
    user_id int not null,
    lang_id int not null,
    PRIMARY KEY (solution_id),
    FOREIGN KEY (user_id) references Users(user_id),
    FOREIGN KEY (question_id) references assignment_question(question_id),
    FOREIGN KEY (lang_id) references Languages(lang_id));


CREATE TABLE Quiz (
	quiz_id int not null auto_increment,
    course_id int not null,
    quiz_num int not null,
    primary key (quiz_id),
    foreign key (course_id) references Course(course_id));

CREATE TABLE quiz_questions(
	question_id int not null,
    quiz_id int not null,
    topic varchar(255) not null,
    statement text not null, 
    answer varchar(255) not null,
    primary key (question_id),
    foreign key (quiz_id) references Quiz(quiz_id));

CREATE TABLE quiz_q_options(
	question_id int not null, 
    question_option varchar(255),
    primary key (question_id, question_option),
    foreign key (question_id) references quiz_questions(question_id));

CREATE TABLE Quiz_attempts(
	quiz_id int not null, 
    question_id int not null, 
    question_option varchar(255) not null,
	user_id int not null,
    primary key (quiz_id, question_id, user_id),
    foreign key (quiz_id) references Quiz(quiz_id),
    foreign key (question_id) references quiz_questions(question_id),
    foreign key (user_id) references Users(user_id));
    

Create table Competition (
	competition_id int not null, 
    competition_title varchar (255) not null, 
    prize_1st varchar(255), 
    prize_2nd varchar(255), 
    prize_3rd varchar(255),
    primary key (competition_id));


create table Participants(
	participant_id int not null auto_increment, 
    competition_id int not null, 
    user_id int not null, 
    primary key (participant_id),
    foreign key (competition_id) references Competition(competition_id),
    foreign key (user_id) references Users(user_id));

create table Judges (
	judge_id int not null auto_increment,
    max_submissions int default 10,
	user_id int not null,
    competition_id int not null,
    primary key (judge_id),
    foreign key (user_id) references Users(user_id),
    foreign key (competition_id) references Competition(competition_id));

create table Submissions (
	submission_id int not null auto_increment,
	participant_id int not null, 
    submission text not null,
    judge_id int not null,
    primary key (submission_id),
    foreign key (participant_id) references Participants(participant_id),
    foreign key (judge_id) references Judges(judge_id));

create table Organizers (
	organizer_id int not null,
	user_id int not null, 
    competition_id int not null,
    primary key (organizer_id),
    foreign key (user_id) references Users(user_id),
    foreign key (competition_id) references Competition(competition_id));

create table Ranking (
	competition_id int not null, 
    user_id int not null, 
    ranking int not null default 0,
    primary key (competition_id, user_id),
    foreign key (user_id) references Users(user_id),
    foreign key (competition_id) references Competition(competition_id));


create table Question_threads (
	thread_id int not null auto_increment, 
    topic varchar(255) not null, 
    statement text not null,
    creator_user_id int not null, 
    date_created datetime not null, 
    views int not null default 0, 
    responses int not null default 0,
    primary key (thread_id),
    foreign key (creator_user_id) references Users(user_id));

create table Message(
	message_id int not null auto_increment, 
	message text not null,
    primary key (message_id));


create table Attachments (
	attachment_id int not null auto_increment, 
    attachment_location varchar(255) not null, 
    message_id int not null,
    primary key (attachment_id),
    foreign key (message_id) references Message(message_id)); 

create table Answer (
	thread_id int not null auto_increment,
    message_id int not null,
    user_id int not null,
    primary key (thread_id, message_id),
    foreign key (message_id) references Message(message_id),
    foreign key (user_id) references Users(user_id),
    foreign key (thread_id) references Question_threads(thread_id));


create table Reply(
	thread_id int not null, 
    message_id int not null, 
    from_user_id int not null,
    primary key (thread_id, message_id),
    foreign key (thread_id) references Question_threads(thread_id),
    foreign key (message_id) references Message(message_id),
    foreign key (from_user_id) references Users(user_id));

create table Reaction (
    message_id int not null, 
    user_id int not null,
    symbol varchar(10), 
    reaction_name varchar (30), 
    primary key (message_id, user_id),
    foreign key (user_id) references Users(user_id),
    foreign key (message_id) references Message(message_id));

create table Comments (
	comment_id int not null, 
    comment_text text not null, 
    user_id int not null, 
    answer_id int not null,
    primary key (comment_id),
    foreign key (user_id) references Users(user_id),
    foreign key (answer_id) references Answer(message_id));

    
create table Problems (
	problem_id int not null, 
    problem_text text not null, 
    difficulty_level varchar(30),
    category_id int not null,
    acceptance_rate int not null,
    primary key (problem_id));

create table Solutions (
	solution_id int not null auto_increment, 
    solution_text text not null, 
    lang_id int  not null, 
    problem_id int not null, 
    views int not null default 0,
    primary key (solution_id),
    foreign key (lang_id) references Languages(lang_id),
    foreign key (problem_id) references Problems(problem_id));


create table User_groups (
    group_id int not null,
	group_name varchar(30) not null,
    created_on timestamp not null default current_timestamp(),
    primary key (group_id));


create table group_members(
	group_id int not null,
    user_id int not null,
    primary key (group_id, user_id),
    foreign key (group_id) references User_groups(group_id),
    foreign key (user_id) references Users(user_id));

create table Sent_messages (
	message_id int not null auto_increment,
	message_body text not null, 
    receiver_id int, -- for single reciever, null in case of group message 
	group_id int,    -- for group messages, null in case of private message
    from_user_id int not null,  
    sendtime timestamp not null default current_timestamp(),
    primary key(message_id),
    foreign key (from_user_id) references Users(user_id),
    foreign key (receiver_id) references Users(user_id),
    foreign key (group_id) references User_groups (group_id));
