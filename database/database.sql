CREATE DATABASE if not exists semproject;

USE semproject;


CREATE TABLE Roles (
    role_id INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(255) NOT NULL,
    role_description TEXT NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE Ranks (
    rank_id INT NOT NULL AUTO_INCREMENT,
    rank_name varchar(50) NOT NULL,
    rank_XP INT NOT NULL,
    PRIMARY KEY (rank_id)
);

CREATE TABLE Users (
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    user_password VARCHAR(20) NOT NULL default 'student123',
    XP INT DEFAULT 0,
    gender VARCHAR(10),
    country VARCHAR(255),
    rank_id INT DEFAULT 0,
    role_id INT DEFAULT 0,
    DOJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP (),
    PRIMARY KEY (user_id),
    FOREIGN KEY (rank_id)
        REFERENCES Ranks (rank_id),
    FOREIGN KEY (role_id)
        REFERENCES Roles (role_id)
);


CREATE TABLE Achievements (
    achievement_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    date_achieved DATETIME DEFAULT CURRENT_TIMESTAMP,
    achievement_title VARCHAR(255) NOT NULL,
    PRIMARY KEY (achievement_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);


CREATE TABLE skill_path (
    path_id INT AUTO_INCREMENT,
    skill_name VARCHAR(255),
    PRIMARY KEY (path_id)
);

CREATE TABLE skillpath_enrollment (
    path_id INT NOT NULL,
    user_id INT NOT NULL,
    progress varchar(15) default 'started',
    PRIMARY KEY (user_id , path_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (path_id)
        REFERENCES skill_path (path_id)
);

CREATE TABLE Instructor (
    instructor_id INT NOT NULL auto_increment,
    instructor_name VARCHAR(255),
    linkedin_link VARCHAR(255),
    PRIMARY KEY (instructor_id)
);

CREATE TABLE Course (
    course_id INT NOT NULL auto_increment,
    course_name VARCHAR(255) NOT NULL,
    course_description TEXT NOT NULL,
    instructor_id INT NOT NULL,
    skill_path_id INT NOT NULL,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP (),
    PRIMARY KEY (course_id),
    FOREIGN KEY (instructor_id)
        REFERENCES Instructor (instructor_id),
    FOREIGN KEY (skill_path_id)
        REFERENCES skill_path (path_id)
);


CREATE TABLE Course_enrollment (
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (user_id , course_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (course_id)
        REFERENCES Course (course_id)
);


CREATE TABLE review (
    rating INT NOT NULL,
    review_text VARCHAR(255) NOT NULL,
    course_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (course_id , user_id),
    FOREIGN KEY (course_id)
        REFERENCES Course (course_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);


CREATE TABLE Lesson (
    lesson_id INT NOT NULL AUTO_INCREMENT,
    lesson_title VARCHAR(255) NOT NULL,
    lesson_description TEXT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (lesson_id),
    FOREIGN KEY (course_id)
        REFERENCES Course (course_id)
);

CREATE TABLE Assignment (
    assignment_id INT NOT NULL AUTO_INCREMENT,
    assignment_title VARCHAR(255) NOT NULL,
    PRIMARY KEY (assignment_id)
);

CREATE TABLE Course_assignments (
    course_id INT NOT NULL,
    assignment_id INT NOT NULL,
    assignment_number INT NOT NULL,
    PRIMARY KEY (course_id , assignment_id),
    FOREIGN KEY (course_id)
        REFERENCES Course (course_id),
    FOREIGN KEY (assignment_id)
        REFERENCES Assignment (assignment_id)
);
    
CREATE TABLE assignment_question (
    question_id INT NOT NULL,
    assignment_id INT NOT NULL,
    question_num INT NOT NULL,
    question_statement TEXT NOT NULL,
    PRIMARY KEY (question_id),
    FOREIGN KEY (assignment_id)
        REFERENCES Assignment (assignment_id)
);


CREATE TABLE Languages (
    lang_id INT NOT NULL AUTO_INCREMENT,
    lang_name VARCHAR(255) NOT NULL,
    developer_name VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    PRIMARY KEY (lang_id)
);

CREATE TABLE solution_question (
    solution_id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    solution TEXT NOT NULL,
    user_id INT NOT NULL,
    lang_id INT NOT NULL,
    PRIMARY KEY (solution_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (question_id)
        REFERENCES assignment_question (question_id),
    FOREIGN KEY (lang_id)
        REFERENCES Languages (lang_id)
);


CREATE TABLE Quiz (
    quiz_id INT NOT NULL AUTO_INCREMENT,
    course_id INT NOT NULL,
    quiz_num INT NOT NULL,
    PRIMARY KEY (quiz_id),
    FOREIGN KEY (course_id)
        REFERENCES Course (course_id)
);

CREATE TABLE quiz_questions (
    question_id INT NOT NULL,
    quiz_id INT NOT NULL,
    topic VARCHAR(255) NOT NULL,
    statement TEXT NOT NULL,
    answer VARCHAR(255) NOT NULL,
    PRIMARY KEY (question_id),
    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (quiz_id)
);

CREATE TABLE quiz_q_options (
    question_id INT NOT NULL,
    question_option VARCHAR(255),
    PRIMARY KEY (question_id , question_option),
    FOREIGN KEY (question_id)
        REFERENCES quiz_questions (question_id)
);

CREATE TABLE Quiz_attempts (
    quiz_id INT NOT NULL,
    question_id INT NOT NULL,
    question_option VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (quiz_id , question_id , user_id),
    FOREIGN KEY (quiz_id)
        REFERENCES Quiz (quiz_id),
    FOREIGN KEY (question_id)
        REFERENCES quiz_questions (question_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);
    

CREATE TABLE Competition (
    competition_id INT NOT NULL,
    competition_title VARCHAR(255) NOT NULL,
    prize_1st VARCHAR(255),
    prize_2nd VARCHAR(255),
    prize_3rd VARCHAR(255),
    PRIMARY KEY (competition_id)
);


CREATE TABLE Participants (
    participant_id INT NOT NULL AUTO_INCREMENT,
    competition_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (participant_id),
    FOREIGN KEY (competition_id)
        REFERENCES Competition (competition_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);

CREATE TABLE Judges (
    judge_id INT NOT NULL AUTO_INCREMENT,
    max_submissions INT DEFAULT 10,
    user_id INT NOT NULL,
    competition_id INT NOT NULL,
    PRIMARY KEY (judge_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (competition_id)
        REFERENCES Competition (competition_id)
);

CREATE TABLE Submissions (
    submission_id INT NOT NULL AUTO_INCREMENT,
    participant_id INT NOT NULL,
    submission TEXT NOT NULL,
    judge_id INT NOT NULL,
    PRIMARY KEY (submission_id),
    FOREIGN KEY (participant_id)
        REFERENCES Participants (participant_id),
    FOREIGN KEY (judge_id)
        REFERENCES Judges (judge_id)
);

CREATE TABLE Organizers (
    organizer_id INT NOT NULL,
    user_id INT NOT NULL,
    competition_id INT NOT NULL,
    PRIMARY KEY (organizer_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (competition_id)
        REFERENCES Competition (competition_id)
);

CREATE TABLE Ranking (
    competition_id INT NOT NULL,
    user_id INT NOT NULL,
    ranking INT NOT NULL DEFAULT 0,
    PRIMARY KEY (competition_id , user_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (competition_id)
        REFERENCES Competition (competition_id)
);

CREATE TABLE Question_threads (
    thread_id INT NOT NULL AUTO_INCREMENT,
    topic VARCHAR(255) NOT NULL,
    statement TEXT NOT NULL,
    creator_user_id INT NOT NULL,
	date_created timestamp NOT NULL DEFAULT current_timestamp(),
    views INT NOT NULL DEFAULT 0,
    responses INT NOT NULL DEFAULT 0,
    PRIMARY KEY (thread_id),
    FOREIGN KEY (creator_user_id)
        REFERENCES Users (user_id)
);

CREATE TABLE Message (
    message_id INT NOT NULL AUTO_INCREMENT,
    message TEXT NOT NULL,
    from_user_id INT NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (from_user_id)
		REFERENCES Users (user_id)
);


CREATE TABLE Attachments (
    attachment_id INT NOT NULL AUTO_INCREMENT,
    attachment_location VARCHAR(255) NOT NULL,
    message_id INT NOT NULL,
    PRIMARY KEY (attachment_id),
    FOREIGN KEY (message_id)
        REFERENCES Message (message_id)
);

CREATE TABLE Answer (
    thread_id INT NOT NULL AUTO_INCREMENT,
    message_id INT NOT NULL,
    PRIMARY KEY (thread_id , message_id),
    FOREIGN KEY (message_id)
        REFERENCES Message (message_id),
    FOREIGN KEY (thread_id)
        REFERENCES Question_threads (thread_id)
);


CREATE TABLE Reply (
    thread_id INT NOT NULL,
    message_id INT NOT NULL,
    PRIMARY KEY (thread_id , message_id),
    FOREIGN KEY (thread_id)
        REFERENCES Question_threads (thread_id),
    FOREIGN KEY (message_id)
        REFERENCES Message (message_id)
);

CREATE TABLE Reaction (
    message_id INT NOT NULL,
    user_id INT NOT NULL,
    symbol VARCHAR(10),
    reaction_name VARCHAR(30),
    PRIMARY KEY (message_id , user_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (message_id)
        REFERENCES Message (message_id)
);

CREATE TABLE Comments (
    comment_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    user_id INT NOT NULL,
    answer_id INT NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (answer_id)
        REFERENCES Answer (message_id)
);

CREATE TABLE Problems (
    problem_id INT NOT NULL,
    problem_name VARCHAR(20) NOT NULL,
    problem_text TEXT NOT NULL,
    difficulty_level VARCHAR(30),
    category varchar(50) NOT NULL,
    acceptance_rate INT NOT NULL,
    PRIMARY KEY (problem_id)
);

CREATE TABLE Solutions (
    solution_id INT NOT NULL AUTO_INCREMENT,
    solution_text TEXT NOT NULL,
    lang_id INT NOT NULL,
    problem_id INT NOT NULL,
    views INT NOT NULL DEFAULT 0,
    PRIMARY KEY (solution_id),
    FOREIGN KEY (lang_id)
        REFERENCES Languages (lang_id),
    FOREIGN KEY (problem_id)
        REFERENCES Problems (problem_id)
);


CREATE TABLE User_groups (
    group_id INT NOT NULL,
    group_name VARCHAR(30) NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP (),
    PRIMARY KEY (group_id)
);


CREATE TABLE group_members (
    group_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (group_id , user_id),
    FOREIGN KEY (group_id)
        REFERENCES User_groups (group_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);

CREATE TABLE Sent_messages (
    message_id INT NOT NULL AUTO_INCREMENT,
    message_body TEXT NOT NULL,
    group_id INT NOT NULL,
    from_user_id INT NOT NULL,
    sendtime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP (),
    viewed bool NOT NULL DEFAULT false,
    PRIMARY KEY (message_id),
    FOREIGN KEY (from_user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (group_id)
        REFERENCES User_groups (group_id)
);

CREATE TABLE Notifications(
	notification_id INT NOT NULL auto_increment,
    notification_message varchar(255) NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (notification_id),
    FOREIGN KEY (user_id)
		REFERENCES Users(user_id)
);

