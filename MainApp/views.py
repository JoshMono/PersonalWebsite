from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    context = {}
    return render(request, "MainApp/index.html", context=context)

def projects(request):
    context = {}
    return render(request, "MainApp/projects.html", context=context)

def about(request):
    context = {}
    return render(request, "MainApp/about.html", context=context)