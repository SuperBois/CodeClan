from django.shortcuts import redirect, render
from django.db import connection
from django.http import HttpResponse
from .models import *
from .forms import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
# Create your views here.

def home(request):
    return render(request, "myapp/Home.html")

def signup(request):
    form = CreateUserForm()
    
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Account Created Succesfully')
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']

            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('dashboard')
    context = {'form':form}
    return render(request, "myapp/SignUp.html", context)

def dashboard(request):
    user_id = request.user.id
    cursor = connection.cursor()
    cursor.execute(f'call get_course({user_id})')
    comments = cursor.fetchall()
    return render(request, "myapp/Dashboard.html")

def admin(request):
    return render(request, "myapp/adminDashboard.html")

def viewproblems(request):
    problemset = Problems.objects.all()
    context = {'problemset': problemset}
    return render(request, "myapp/ViewProblems.html", context)

def solveproblems(request,pk):
    problem = Problems.objects.get(problem_id = pk)
    context = {'problem': problem}
    return render(request, "myapp/SolveProblems.html", context)

def thread(request, pk):
    thread = QuestionThreads.objects.get(thread_id=pk)
    creator = Users.objects.get(user_id = thread.creator_user_id)
    
    cursor = connection.cursor()
    cursor.execute(f'call get_comments({pk})')
    comments = cursor.fetchall()

    cursor.execute(f'call get_replies({pk})')
    replies = cursor.fetchall()

    cursor.execute(f'call get_answers({pk})')
    answers = cursor.fetchall()
    cursor.close()
    
    context = {'thread': thread, 'creator': creator, 'comments': comments, 'replies': replies, 'answers': answers }
    print(answers)
    return render (request, 'myapp/thread.html', context)

def editProfile(request):
    return render("edit profile")

def aboutus(request):
    return render(request, 'myapp/about.html')

def discussions(request):
    discussion_threads = QuestionThreads.objects.all()
    context = {'discussions_thread': discussion_threads}
    return render(request, "myapp/viewDiscussions.html",context)

def contests(request):
    contestset = Competition.objects.all()
    context = {'contests': contestset}
    return render(request, "myapp/contests.html", context)

def support(request):
    return render(request, "myapp/support.html")

def mycourses(request):
    contestset = Course.objects.all()
    context = {'courses': contestset}
    return render(request, "myapp/courses.html", context)

def achievements(request):
    return render(request, "myapp/achievements.html")

def news(request):
    return render(request, "myapp/news.html")

def loginPage(request1):
    form = CreateUserForm()
    print('the method of request is '+request1.method)
    if request1.method == 'POST':
        username = request1.POST.get('username')
        password = request1.POST.get('password')
        

        user = authenticate(request1, username=username, password=password)

        if user is not None:
            login(request=request1, user=user)
            return redirect('dashboard')
        else:
            print('user could not be logged in')
            messages.info(request1, 'Incorrect combination of Username and Password')
    context = {'form': form}
    return render(request1, 'myapp/Home.html', context)

def submit(request):
    return render(request, "myapp/submit.html")

def logout_user(request):
    logout(request)
    return home(request)

def course_details(request,pk):
    course = Course.objects.get(course_id = pk)
    instructor = Instructor.objects.get(instructor_id = course.instructor_id)
    context = {'course': course, 'instructor': instructor}
    return render(request, 'myapp/course_detail.html', context)

def enroll_course(request, pk):
    course = Course.objects.get(course_id = pk)
    context = {'course': course}
    return render(request, 'myapp/enrolled.html', context)

def addcourse(request):
    form = CreateCourseForm()
    if request.method == "POST":
         form = CreateCourseForm(request.post)
         if form.is_valid():
             form.save()
             
    context = {'form': form}
    return render(request, 'myapp/addCourse.html', context)