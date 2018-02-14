# TODOS


* volver atras link que te lleve atras si estabas en el dominio de las recetas, sino que te lleve a recipes_path
* muy villa el select de las categorias, ver si se puede hacer mas elegante
* ver que onda de ir borrando las  notificaciones de la db
* fotos no funcionan bien, ver de subir a AWS


* BUG editando recetas, borras el ing pero no se borra realmente
# Features

* https://coderwall.com/p/rqjjca/creating-a-scoped-invitation-system-for-rails
* https://github.com/tomichj/invitation
* https://github.com/scambra/devise_invitable
* https://stackoverflow.com/questions/7609483/create-groups-that-users-can-join-what-would-be-a-good-approach

* Compartir en facebook: https://stackoverflow.com/questions/5340109/sharing-articles-on-facebook-using-the-facebook-api
    * Titulo compartir: boton link, boton facebook



* crear pdf con recetas: https://github.com/mileszs/wicked_pdf


* poner todas las relaciones en los modelos cuando este todo listo
* no categorias duplicadas
* chequear nombres de recetas parecidas

* moidalidad instertar receta? te aparece un pop up para buscar recetas y la que elegis te la pega como hipervinculo, despues le pongo raw en el output i guess.

* Al buscar, que busque en todo, pero si yo en el sidebar elijo lo que sea, que filtre a esas recetas dentro de la busqueda, si es posible.

* avisar que alguien hizo una nueva version?


* crear link en administrar para administrar tu usuario

* crear categoria desde creando una receta -> empece pero tengo un problema con los redirects.
        http://flaviusim.com/blog/2012/05/28/create-new-records-with-bootstrap-modal-and-unobtrusive-javascript-in-rails/
        https://coderwall.com/p/ej0mhg/open-a-rails-form-with-twitter-bootstrap-modals

* CHECK INTEGRITY cuando se borra usuario... a quien se las deberia pasar? o sea, ahora es a mi, pero si fuera el concepto de grupos?

* hacer que la categoria misc sea no borrable, o hacer que si no existe, se pase a la primera que exista


* favoritos


* mas largo link de recetas

* link de invitacion a un grupos

* google o facebook auth


# estilo
* Errores que se pongan rojas las forms
* Texto debajo del logo de recetas.
* elegi un par, por ahora me gusta pero ver que onda despues

    * https://themeforest.net/item/socialchef-social-recipe-html-template/8568727?s_rank=3
    * https://themeforest.net/item/recipe-food-bootstrap-template/19150443?s_rank=4
    * https://wpgeeky.com/html/food/food/recipe-index1.html
    * http://www.themeenergy.com/themes/html/social-chef/recipes.html

    * https://thinkflipp.com/work/

* login

# usabilidad
Poder darle titulos a los ingredientes, tipo: Masa: .... Relleno: ...
* will paginate con bootstrap, esta en el video de professional rails dev
* Boton de ayuda debajo del nombre de usuario, te explica como ahcer las cosas

* SACAR CATEGORIAS para todos excepto admin, si es que logro hacer lo del modal... tengo que ver como no hacer un redirect despues de la accion

* Hacer que el admin pueda ver las recetas de cada user.


* dividir los enters en pasos numerados




# Pruebas

# FUTURO
Hacer el tutorial de rails + ember para ver como integrar api con front end

# No pasadas:
Me quede en Vinagreta para Carpaccio de Salmon

{"nombre":"Tartitas de Ganache","ingredientes":"chocolate","cantidades":"<b>Masa:</b>, 1/4 de taza de manteca derretida (50gr), 1 y 1/2 taza de migas de galletitas de chocolate, <b>Ganache:</b>, 200gr de crema, 200gr de chocolate cobertura, vainilla","categoria":"Postre","instrucciones":""}
{"nombre":"Torta de Ricotta","ingredientes":"ricotta, ricota","cantidades":"<b>Masa:</b>, 400gr de harina leudante, 200gr de manteca, 120gr de azúcar, 1 huevo, vainilla, <b>Relleno:</b>, 500gr de ricotta, 2 huevos, 70gr de maicena, 100gr de crema, 130gr de azúcar, ralladura, vainilla","categoria":"Postre","instrucciones":""}

# GEneral
flash redirect que tenga para si es alert o danger o no se que

# GROUPS

De Ahora en mas solo tiene que pullear todo depende de que usuario esta conectado. Las categorias y recetas tienen que estar scoped dentro de grupos. Los usuarios tienen que estar sueltos.
