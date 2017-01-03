from django.views.generic import FormView, RedirectView
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import HttpResponseRedirect
from .forms import LoginForm
from django.conf import settings


class LoginView(FormView):
    template_name = 'affiliated_schools.html'
    form_class = LoginForm
    success_url = '/affiliated_schools/'

    def form_valid(self, form):
        super(LoginView, self).form_valid(form)
        user = authenticate(**form.cleaned_data)
        if user:
            login(self.request, user)
            return HttpResponseRedirect(self.success_url)
        else:
            return HttpResponseRedirect(self.request.META.get('HTTP_REFERER'))


class LogoutView(RedirectView):
    url = settings.LOGIN_URL

    def get(self, request, *args, **kwargs):
        logout(request)
        return super(LogoutView, self).get(request, *args, **kwargs)
