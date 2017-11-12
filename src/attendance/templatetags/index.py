from django import template
register = template.Library()

@register.filter
def index(List, i):
    return List[int(i)]

# @register.filter 
# def get_overall_att(Queryset):
#     return Queryset.enrl