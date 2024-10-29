import json
from django.http import Http404, JsonResponse
from django.shortcuts import render
from django.views import generic


class ProductListView(generic.TemplateView):
    template_name = 'list.html'

    def get(self, request, *args, **kwargs):
        product_filter = request.GET.get('filter', None)
        products = json.loads(open('products.json').read())['products']

        if product_filter:
            if not request.headers.get('HX-Request'):
                raise Http404('Should be an HTMX request')

            try:
                products = [product for product in products if product['filterId'] == int(product_filter)]

                return render(
                    request,
                    'list.html',
                    {
                        'products': products,
                    },
                )

            except json.JSONDecodeError:
                return JsonResponse({'error': 'Invalid JSON payload'}, status=400)

        return render(
            request,
            'home.html',
            {
                'products': products,
            },
        )
