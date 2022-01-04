# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Achievements(models.Model):
    achievement_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    date_achieved = models.DateTimeField(blank=True, null=True)
    achievement_title = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'Achievements'


class Answer(models.Model):
    thread = models.OneToOneField('QuestionThreads', models.DO_NOTHING, primary_key=True)
    message = models.ForeignKey('Message', models.DO_NOTHING)
    user = models.ForeignKey('Users', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Answer'
        unique_together = (('thread', 'message'),)


class Assignment(models.Model):
    assignment_id = models.AutoField(primary_key=True)
    assignment_title = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'Assignment'


class Attachments(models.Model):
    attachment_id = models.AutoField(primary_key=True)
    attachment_location = models.CharField(max_length=255)
    message = models.ForeignKey('Message', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Attachments'


class Comments(models.Model):
    comment_id = models.IntegerField(primary_key=True)
    comment_text = models.TextField()
    user = models.ForeignKey('Users', models.DO_NOTHING)
    answer = models.ForeignKey(Answer, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Comments'


class Competition(models.Model):
    competition_id = models.IntegerField(primary_key=True)
    competition_title = models.CharField(max_length=255)
    prize_1st = models.CharField(max_length=255, blank=True, null=True)
    prize_2nd = models.CharField(max_length=255, blank=True, null=True)
    prize_3rd = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Competition'


class Course(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=255)
    course_description = models.TextField()
    instructor = models.ForeignKey('Instructor', models.DO_NOTHING)
    skill_path = models.ForeignKey('SkillPath', models.DO_NOTHING)
    created_on = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Course'


class CourseAssignments(models.Model):
    course = models.OneToOneField(Course, models.DO_NOTHING, primary_key=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING)
    assignment_number = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Course_assignments'
        unique_together = (('course', 'assignment'),)


class CourseEnrollment(models.Model):
    user = models.OneToOneField('Users', models.DO_NOTHING, primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Course_enrollment'
        unique_together = (('user', 'course'),)


class Instructor(models.Model):
    instructor_id = models.AutoField(primary_key=True)
    instructor_name = models.CharField(max_length=255, blank=True, null=True)
    linkedin_link = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Instructor'


class Judges(models.Model):
    judge_id = models.AutoField(primary_key=True)
    max_submissions = models.IntegerField(blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    competition = models.ForeignKey(Competition, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Judges'


class Languages(models.Model):
    lang_id = models.AutoField(primary_key=True)
    lang_name = models.CharField(max_length=255)
    developer_name = models.CharField(max_length=255)
    release_year = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Languages'


class Lesson(models.Model):
    lesson_id = models.AutoField(primary_key=True)
    lesson_title = models.CharField(max_length=255)
    lesson_description = models.TextField()
    course = models.ForeignKey(Course, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Lesson'


class Message(models.Model):
    message_id = models.AutoField(primary_key=True)
    message = models.TextField()

    class Meta:
        managed = False
        db_table = 'Message'


class Organizers(models.Model):
    organizer_id = models.IntegerField(primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    competition = models.ForeignKey(Competition, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Organizers'


class Participants(models.Model):
    participant_id = models.AutoField(primary_key=True)
    competition = models.ForeignKey(Competition, models.DO_NOTHING)
    user = models.ForeignKey('Users', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Participants'


class Problems(models.Model):
    problem_id = models.IntegerField(primary_key=True)
    problem_text = models.TextField()
    difficulty_level = models.CharField(max_length=30, blank=True, null=True)
    acceptance_rate = models.IntegerField()
    category = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'Problems'


class QuestionThreads(models.Model):
    thread_id = models.AutoField(primary_key=True)
    topic = models.CharField(max_length=255)
    statement = models.TextField()
    creator_user = models.ForeignKey('Users', models.DO_NOTHING)
    date_created = models.DateTimeField()
    views = models.IntegerField()
    responses = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Question_threads'


class Quiz(models.Model):
    quiz_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING)
    quiz_num = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Quiz'


class QuizAttempts(models.Model):
    quiz = models.OneToOneField(Quiz, models.DO_NOTHING, primary_key=True)
    question = models.ForeignKey('QuizQuestions', models.DO_NOTHING)
    question_option = models.CharField(max_length=255)
    user = models.ForeignKey('Users', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Quiz_attempts'
        unique_together = (('quiz', 'question', 'user'),)


class Ranking(models.Model):
    competition = models.OneToOneField(Competition, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    ranking = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Ranking'
        unique_together = (('competition', 'user'),)


class Ranks(models.Model):
    rank_id = models.AutoField(primary_key=True)
    rank_name = models.CharField(max_length=50)
    rank_xp = models.IntegerField(db_column='rank_XP')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Ranks'


class Reaction(models.Model):
    message = models.OneToOneField(Message, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey('Users', models.DO_NOTHING)
    symbol = models.CharField(max_length=10, blank=True, null=True)
    reaction_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Reaction'
        unique_together = (('message', 'user'),)


class Reply(models.Model):
    thread = models.OneToOneField(QuestionThreads, models.DO_NOTHING, primary_key=True)
    message = models.ForeignKey(Message, models.DO_NOTHING)
    from_user = models.ForeignKey('Users', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Reply'
        unique_together = (('thread', 'message'),)


class Roles(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=255)
    role_description = models.TextField()

    class Meta:
        managed = False
        db_table = 'Roles'


class SentMessages(models.Model):
    message_id = models.AutoField(primary_key=True)
    message_body = models.TextField()
    group = models.ForeignKey('UserGroups', models.DO_NOTHING)
    from_user = models.ForeignKey('Users', models.DO_NOTHING)
    sendtime = models.DateTimeField()
    viewed = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Sent_messages'


class Solutions(models.Model):
    solution_id = models.AutoField(primary_key=True)
    solution_text = models.TextField()
    lang = models.ForeignKey(Languages, models.DO_NOTHING)
    problem = models.ForeignKey(Problems, models.DO_NOTHING)
    views = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'Solutions'


class Submissions(models.Model):
    submission_id = models.AutoField(primary_key=True)
    participant = models.ForeignKey(Participants, models.DO_NOTHING)
    submission = models.TextField()
    judge = models.ForeignKey(Judges, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Submissions'


class UserGroups(models.Model):
    group_id = models.IntegerField(primary_key=True)
    group_name = models.CharField(max_length=30)
    created_on = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'User_groups'


class Users(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=255)
    user_email = models.CharField(max_length=255)
    fname = models.CharField(max_length=255)
    lname = models.CharField(max_length=255)
    user_password = models.CharField(max_length=20)
    xp = models.IntegerField(db_column='XP', blank=True, null=True)  # Field name made lowercase.
    gender = models.CharField(max_length=10, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    rank = models.ForeignKey(Ranks, models.DO_NOTHING, blank=True, null=True)
    role = models.ForeignKey(Roles, models.DO_NOTHING, blank=True, null=True)
    doj = models.DateTimeField(db_column='DOJ', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Users'


class AssignmentQuestion(models.Model):
    question_id = models.IntegerField(primary_key=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING)
    question_num = models.IntegerField()
    question_statement = models.TextField()

    class Meta:
        managed = False
        db_table = 'assignment_question'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class GroupMembers(models.Model):
    group = models.OneToOneField(UserGroups, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey(Users, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'group_members'
        unique_together = (('group', 'user'),)


class QuizQOptions(models.Model):
    question = models.OneToOneField('QuizQuestions', models.DO_NOTHING, primary_key=True)
    question_option = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'quiz_q_options'
        unique_together = (('question', 'question_option'),)


class QuizQuestions(models.Model):
    question_id = models.IntegerField(primary_key=True)
    quiz = models.ForeignKey(Quiz, models.DO_NOTHING)
    topic = models.CharField(max_length=255)
    statement = models.TextField()
    answer = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'quiz_questions'


class Review(models.Model):
    rating = models.IntegerField()
    review_text = models.CharField(max_length=255)
    course = models.OneToOneField(Course, models.DO_NOTHING, primary_key=True)
    user = models.ForeignKey(Users, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'review'
        unique_together = (('course', 'user'),)


class SkillPath(models.Model):
    path_id = models.AutoField(primary_key=True)
    skill_name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'skill_path'


class SkillpathEnrollment(models.Model):
    path = models.ForeignKey(SkillPath, models.DO_NOTHING)
    user = models.OneToOneField(Users, models.DO_NOTHING, primary_key=True)
    progress = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'skillpath_enrollment'
        unique_together = (('user', 'path'),)


class SolutionQuestion(models.Model):
    solution_id = models.AutoField(primary_key=True)
    question = models.ForeignKey(AssignmentQuestion, models.DO_NOTHING)
    solution = models.TextField()
    user = models.ForeignKey(Users, models.DO_NOTHING)
    lang = models.ForeignKey(Languages, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'solution_question'
