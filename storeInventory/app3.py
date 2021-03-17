from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound
import mysql.connector  # imported sql connector for database


#----------------- Show  page Home --------------------------#
@view_config(
    route_name='home',
    renderer='view/templates/home.jinja2'
)
def home(request):
    conn = mysql.connector.connect(
        host="localhost",
        user="web_user",
        passwd='4aOMcvLHen7Cepxo',  # please enter pws 0eTnBQz4yE3jfO6R
        database="pyramidproject")
    cur = conn.cursor()
    cur.execute('SELECT Id, name, total, link FROM Inventory')
    inv = []
    for (id, name, total, link) in cur:
        inv.append({'id': id, 'name': name, 'total': total, 'link': link})
    return{"foot": 'SanChris thanks you for trusting our products', "greeting": 'Welcome to SanChris Inventory Market', "inv": inv}


#----------------- Show page edit/id ---------------------#
@ view_config(
    route_name='edit',
    renderer='view/templates/edit.jinja2'


)
def edit(request):
    conn = mysql.connector.connect(
        host="localhost", user="web_user", passwd='4aOMcvLHen7Cepxo', database="pyramidproject")  # please enter ypur pws
    cur = conn.cursor()

    if request.method == 'POST':
       # print({'name': request.POST['name'], 'total': request.POST['total'],
        #  'link': request.POST['link'], 'id': request.matchdict['id']})
        cur.execute(
            "UPDATE Inventory SET `name`=%(name)s, `total`=%(total)s, `link`=%(link)s WHERE Id = %(id)s",
            {'name': request.POST['name'], 'total': request.POST['total'], 'link': request.POST['link'], 'id': request.matchdict['id']})
        conn.commit()
        return HTTPFound('/')
    else:
        cur.execute(
            "SELECT Id, name, total, link FROM Inventory WHERE Id = %(id)s", {'id': request.matchdict['id']})
        (id, name, total, link) = cur.fetchone()
        return {"foot": 'SanChris thanks you for trusting our products', "greeting": 'Edit Inventory', "name": '', 'item': {'id': id, 'name': name, 'total': total, 'link': link}}


#--------------------inventory page-------------------------------------------------#
@ view_config(
    route_name='inventory',
    renderer='view/templates/inventory.jinja2'
)
def inventory(request):
    conn = mysql.connector.connect(
        host="localhost",
        user="web_user",
        passwd='4aOMcvLHen7Cepxo',  # please enter pws 0eTnBQz4yE3jfO6R
        database="pyramidproject")
    cur = conn.cursor()
    cur.execute('SELECT Id, name, total, link FROM Inventory')
    inv = []
    for (id, name, total, link) in cur:
        inv.append({'id': id, 'name': name, 'total': total, 'link': link})
    return{"foot": 'SanChris thanks you for trusting our products', "greeting": 'Please take your time and browse of site', "inv": inv}
#--------------------product page-------------------------------------------------#


@ view_config(
    route_name='product',
    renderer='view/templates/product.jinja2'
)
def product(request):
    conn = mysql.connector.connect(
        host="localhost",
        user="web_user",
        passwd='4aOMcvLHen7Cepxo',  # please enter pws 0eTnBQz4yE3jfO6R
        database="pyramidproject")
    cur = conn.cursor()
    cur.execute('SELECT Id, name, total, link FROM Inventory')
    inv = []
    for (id, name, total, link) in cur:
        inv.append({'id': id, 'name': name, 'total': total, 'link': link})
    return{"foot": 'SanChris thanks you for trusting our products', "greeting": 'Please take your time and browse of site', "inv": inv}


#------------- Set up and run pyramid and jinja2 --------------------#
if __name__ == "__main__":
    config = Configurator()
    config.include('pyramid_jinja2')
    config.include('pyramid_debugtoolbar')
    config.add_static_view(name='static',
                           path='model/static')
    config.add_route('home', '/')
    config.add_route('edit', '/edit/{id}')
    config.add_route('inventory', '/inventory')
    config.add_route('product', '/product')
    config.scan()
    app = config.make_wsgi_app()
server = make_server('0.0.0.0', 8080, app)  # default port for pyramid is 6543
server.serve_forever()
