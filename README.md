# TODOS


* volver atras link que te lleve atras si estabas en el dominio de las recetas, sino que te lleve a recipes_path
* muy villa el select de las categorias, ver si se puede hacer mas elegante
* ver que onda de ir borrando las  notificaciones de la db

* INTERNATIONALIZATION

* FOTOS no estarian funcionando bien... no se por que carajo heroku dejo de compilarlas

* categorias: cuando borro una categoria deberia ir a una categoria universal "SIN CATEGORIA" o algo asi... nadie puede acceder a ella, no pertenece a ningun grupo

# Features

* https://coderwall.com/p/rqjjca/creating-a-scoped-invitation-system-for-rails
* https://github.com/tomichj/invitation
* https://github.com/scambra/devise_invitable
* https://stackoverflow.com/questions/7609483/create-groups-that-users-can-join-what-would-be-a-good-approach
https://stackoverflow.com/questions/11600928/when-should-one-use-a-has-many-through-relation-in-rails

* Compartir en facebook: https://stackoverflow.com/questions/5340109/sharing-articles-on-facebook-using-the-facebook-api
    * Titulo compartir: boton link, boton facebook

* en categories view un contador de cuantas recetas hay de ese tipo/

* crear pdf con recetas


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


* cuando pases una receta de un gruop a otro, si ya tiene la misma categoria, dejarla


# estilo

* copiar la division entre notifs user y favs de ml
* Errores que se pongan rojas las forms
* Texto debajo del logo de recetas.
* elegi un par, por ahora me gusta pero ver que onda despues

    * https://themeforest.net/item/socialchef-social-recipe-html-template/8568727?s_rank=3
    * https://themeforest.net/item/recipe-food-bootstrap-template/19150443?s_rank=4
    * https://wpgeeky.com/html/food/food/recipe-index1.html
    * http://www.themeenergy.com/themes/html/social-chef/recipes.html

    * https://thinkflipp.com/work/


* flex box no se ve bien en celus viejos https://stackoverflow.com/questions/24899943/how-do-i-make-flex-box-work-in-safari
https://github.com/postcss/autoprefixer/issues/786

    en realidad lo que tengo quehacer aca es que para xs directamente use rows y no flexbox, creo que ya lo hice, cuando vuelva a subir todo, veremos


# usabilidad
Poder darle titulos a los ingredientes, tipo: Masa: .... Relleno: ...
* will paginate con bootstrap, esta en el video de professional rails dev
* Boton de ayuda debajo del nombre de usuario, te explica como ahcer las cosas

* SACAR CATEGORIAS para todos excepto admin, si es que logro hacer lo del modal... tengo que ver como no hacer un redirect despues de la accion

* Hacer que el admin pueda ver las recetas de cada user.

* que cuando te muestre todas las recetas de las divida por cats

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


* agregar fk a cat de su grupo.
* hacer entidad recipeGroup con fk a cat fk a R y fk a grupo
* sacar col cat_id de R, ya no lo necesita
* RG has user through Recipe
* RG builds R




* poner las relaciones en el modelo:
    * has many & belongs to many de user a group :through memberships
    * category has group...

* cuando hago una receta en un grupo, se me guarda en mis recetas obviamente, se generan los dos recursos, receta y recetaDeGrupo.
* que me obligue a crear un grupo si me mando a hacer recetas sin grupo, asi despues de ultima voy agregando gente a mi grupo.
* admin dashboard para ver todos los usuarios y cambiar nombre al grupo
* quien puede mandar invitacoines? todos?:
    * yo diria que si, pero el admin puede echar a quien sea
    * el admin real no deberia poder editar y borrar lo de los demas...

* yo tendria que tener una cuenta superadmin para entrar a todas las rutas y por ahi eventualmente tener un mega dashboard

* grupos pueden tener el mismo nombre
* solo te pueden invitar por mail, vos no podes pedir entrar y los demas no te pueden invitar

* crear welcome controller que te guie para que hagas un grupo e invites a tus amigos
