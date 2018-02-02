# TODOS


* volver atras link que te lleve atras si estabas en el dominio de las recetas, sino que te lleve a recipes_path
* muy villa el select de las categorias, ver si se puede hacer mas elegante

# Features

* crear pdf con recetas


* poner todas las relaciones en los modelos cuando este todo listo
* no categorias duplicadas
* chequear nombres de recetas parecidas

* moidalidad instertar receta? te aparece un pop up para buscar recetas y la que elegis te la pega como hipervinculo, despues le pongo raw en el output i guess.

* Al buscar, que busque en todo, pero si yo en el sidebar elijo lo que sea, que filtre a esas recetas dentro de la busqueda, si es posible.


* tipo ml campanita con notificaciones de comentarios que se hicieron en tu receta.:
        https://github.com/rails-engine/notifications
        https://github.com/simukappu/activity_notification
        https://gorails.com/episodes/in-app-navbar-notifications
        http://api.rubyonrails.org/v5.0/classes/ActiveSupport/Notifications.html
        http://aalvarez.me/blog/posts/easy-notification-system-in-rails.html


        * casi listo, terminar de arreglar el tema de que no funciona bien cuando las toma a cada intervalo.
        * ver que onda de ir borrandolas de la db



* avisar que alguien hizo una nueva version?
* centrar search form

* crear link en administrar para administrar tu usuario

* que los comentarios se hagan en real time... un poco exagerado, pero para probarlo.

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
* dejar fijas las fonts
* Texto debajo del logo de recetas.
* https://themeforest.net/item/socialchef-social-recipe-html-template/8568727?s_rank=3
* https://themeforest.net/item/recipe-food-bootstrap-template/19150443?s_rank=4

* NO ENTRA DEL TODO LA NOTIFICACION EN EL CELU, ARREGLAR





# usabilidad
Poder darle titulos a los ingredientes, tipo: Masa: .... Relleno: ...
* will paginate con bootstrap, esta en el video de professional rails dev
* Boton de ayuda debajo del nombre de usuario, te explica como ahcer las cosas

* SACAR CATEGORIAS para todos excepto admin, si es que logro hacer lo del modal... tengo que ver como no hacer un redirect despues de la accion

* Hacer que el admin pueda ver las recetas de cada user.

* Sacar lo de que se abra el modal para poder compartir, y por ahi poner un tooltip mas informativo

# Pruebas




# No pasadas:
Me quede en Vinagreta para Carpaccio de Salmon

{"nombre":"Tartitas de Ganache","ingredientes":"chocolate","cantidades":"<b>Masa:</b>, 1/4 de taza de manteca derretida (50gr), 1 y 1/2 taza de migas de galletitas de chocolate, <b>Ganache:</b>, 200gr de crema, 200gr de chocolate cobertura, vainilla","categoria":"Postre","instrucciones":""}
{"nombre":"Torta de Ricotta","ingredientes":"ricotta, ricota","cantidades":"<b>Masa:</b>, 400gr de harina leudante, 200gr de manteca, 120gr de azúcar, 1 huevo, vainilla, <b>Relleno:</b>, 500gr de ricotta, 2 huevos, 70gr de maicena, 100gr de crema, 130gr de azúcar, ralladura, vainilla","categoria":"Postre","instrucciones":""}

# GEneral
flash redirect que tenga para si es alert o danger o no se que

VIDEO: 22 PROFESSIONAL RUBY DEV
