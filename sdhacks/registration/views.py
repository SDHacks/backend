

from registration.forms import UserCreationForm

from django.views.generic.edit import FormView


class SignupView(FormView):

    template_name = 'registration/signup.html'
    form_class = UserCreationForm
    success_url = '/'

    def form_valid(self, form):
        form.save()
        return super(SignupView, self).form_valid(form)
