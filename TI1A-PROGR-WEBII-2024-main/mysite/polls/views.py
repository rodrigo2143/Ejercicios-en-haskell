from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.urls import reverse

from polls.models import Choice, Question
from django.template import loader
from django.views.generic import ListView, DetailView
from .models import MiModelo

class MiModeloListView(ListView):
    model = MiModelo
    template_name = 'mimodelo_list.html'
    context_object_name = 'objetos'

class MiModeloDetailView(DetailView):
    model = MiModelo
    template_name = 'mimodelo_detail.html'

# Create your views here.
def index(request):
    lastest_question_list = Question.objects.order_by("-pub_date")[:5]
    template = loader.get_template("polls/index.html")
    output = ", ".join( q.question_text for q in lastest_question_list)
    context = {
        "lastest_question_list": lastest_question_list
    }
    #return HttpResponse(template.render(context,request))
    return render(request,"polls/index.html", context)


def detail(request, question_id):
    # try:
    #     question = Question.objects.get (pk=question_id)   
    # except Question.DoesNotExist :
    #     raise Http404("Question does not exist")
    question = get_object_or_404(Question, pk=question_id)
    return render(request, "polls/detail.html", {'question':question})

def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, "polls/results.html", {"question":question})


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk = request.POST['choice'])  
    except (KeyError, Choice.DoesNotExist):
        return render(request, "polls/detail.html", {
            "question": question,
            "error_message": "You didn't select a choice."
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
    