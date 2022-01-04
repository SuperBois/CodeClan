. Users (user_email, display_name, fname, mname, lname, hashed_password, XP, DOB, DOJ, gender, country, role_id)

    2. Rank(rank_id, rank_name, description, role_id, XP)

    3. Role (role_id, role_name, description)
    
    4. Achievements (achievement_id, user_email, date_achieved, achievement_title)
    (filled by triggers)
    
    5. skillpath_enrollments (user_email, path_id)
    
    6. skill_path(path_id, skill_name)

    7. course_enrollment(user_email, course_id)

    8.  courses (course_id, course_name, course_description, instructor, created_on, skill_path_id)
          - has
      
        1. review(review_id, rating, review_text, course_id, user_email)
        
        2. Lesson (lesson_id, lesson_title, lesson_description, lesson_number, course_id)

        3. assignment(assignment_id, assignment_title, course_id)
            - has

                1. assignment_question(assignment_id, assignment_question_id, question_statement)
                
                2. assignment_submission(assignment_id, user_email, submission) 

                3.  solution_question (question_id, solution, produced by, date posted, time comlexity, language version)
                
                4.  Language Version (name, version, release_date)
                
                5.  Programming language(name, developer, first release, num of users)

        4.  Quiz (quiz_id, question_id, course_id, question_marks)
            - has
            
            1.   quiz_questions(question_id, topic, statement, answer)
            
            2.   quiz_q_options(question_id, option)

            3.  User_attempts (quiz_id, user_email, quiz_attempt_id)
            
            4.  Quiz_attempt_id(attempt_id, quiz_id, question_id, option_id) 
            (filled using trigger)
            
    9.  Competition (competition_id, competition_title, prize_1st, prize_2nd, prize_3rd)

        1.  Submissions (participant_id, submission, judge_id)

        2.  Participants(participant_id, competition_id, user_email)
        
        3.  Judges (judge_id, competition_id, user_email)
        
        4.  Organizers (competition_id, user_email) 
        
        5.  Ranking (competition_id, user_email, ranking)

        6.  Sponsors (competition_id, company_id, budget)

    10. Company (company_id, name, logo, CEO, employeeNum, Founding_Date, address_headoffice)
        
    11. Discussion (discussion_id, topic, created_by, date_created, views, responses)

        1.  Answer (discussion_id, answer_id)
        
        2.  Reply(reply_id, reply_text, user_email, discussion_id, upvotes)
        
        3.  Attachments (attachment_id, alt text, attachment_location, answer_id) 
        
        4.  Reaction (reaction, symbol, name, answer_id, user_email)
        
        5.  Comments (comment_id, comment_text, user_email, answer_id)
    
    12. Sent_messages (message_id, To_user_email, from_user_email, text, timestamp) // private 1 to 1 messages
   
    13. User_teams (team_id, team_name, team_pic, team_leader_user_id)
        1.  team_members (team_id, user_email)
        
        2. team_Messages (team_message_id, From_user_email, to_team_id, reply_to_msg_id, text, timestamp)  // group messages