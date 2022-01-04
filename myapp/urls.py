from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    # navbar links
    path('', views.home, name='home'),
    path('problems/', views.viewproblems, name='problems'),
    path('discussions/', views.discussions, name='discussions'),
    path('contests/', views.contests, name='contests'),
    path('support/', views.support, name='support'),
    path('register/', views.signup, name='register'),
    path('support/', views.support, name = 'support'),
    path('about/', views.aboutus, name = 'about'),
    # side bar links
    path('dashboard/', views.dashboard, name='dashboard'),
    path('solve/<str:pk>/', views.solveproblems, name = 'solve'),
    path('courses/',views.mycourses, name='courses'),
    path('achievements/', views.achievements, name='achievements'),
    path('newsfeed/', views.news, name='news'),
    path('edit/', views.editProfile, name='editProfile'),
    path('loginPage/', views.loginPage, name='login'),
    # other pages
    path('thread/<str:pk>', views.thread, name='thread'),
    path('course/<str:pk>', views.course_details, name='course'),
    path('enroll/<str:pk>', views.enroll_course, name='enroll'),
    path('submit/', views.submit, name="submit"),
    path('logout/', views.logout_user, name="logout"),
    # instructor specific links
    path('addcourse/', views.addcourse, name="addcourse")
]
    