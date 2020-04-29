# Flutter #4 : Premier projet en Flutter
#_liv/flutter

Avant de commencer à developper notre premiere application en Flutter, on va se familiariser avec l’environnement et l’application témoin que vous avez lorsque vous démarrez un projet.
Pour cet article je ne vais que vous parler des outils présent sur Android Studio et IntelliJ.
/!\ *Ici on part du constat que tout est bien installé et que tout fonctionne, si vous avez des soucis, n’hésitez pas à allez consulter notre seigneur et maître   .* [Stack Overflow](https://stackoverflow.com/) 
**Créons votre premier projet.**
Allez dans File / New / New Flutter Project.
￼
Sélectionnez ensuite Flutter Application, il vous est possible aussi de créer un plugin, un package ou un module. Nous allons pour le moment nous concentrer sur une application.
￼
Comme sur n’importe quel autre projet, nous allons lui donner un nom. Attention il faudra respecter les règles de dommage des packages de Dart, soit un nom en minuscule avec des underscore ( _ ) au lieu d’espaces.
￼
Sur le prochain écran il vous sera proposé plusieurs cases à cocher.

**AndroidX** : C’est une librairie qui facilite la retrocompatibilité avec des anciennes versions d’android. Je dirai qu’aujourd’hui c’est indispensable d’activer cette option.

**Platform channel languages** : Si vous souhaitez faire un projet Flutter hybride avec du développement Flutter, iOS et Android, vous pouvez cochez ces cases pour pouvoir programmer en Kotlin ou Swift.
![](post_2/Capture-d%E2%80%99e%CC%81cran-2019-11-20-a%CC%80-13.41.03-1024x877.png)
Une fois processus terminez vous allez apercevoir qu’il y a déjà du code sur votre projet. Lancez la compilation sur un émulateur de votre choix et testez l’application témoin. 

C’est un projet très simple, on appuis sur un bouton, un nombre s’incrémente. 
![](post_2/starterapp.png)
Pour builder cette application on est partit d’un seul et même code, et le tout est utilisable sur iOS et Android, magique !
Maintenant explorons un peu le code de cette application.
**Le code**
Regardons la première ligne du fichier main.dart
*void*main() => runApp(MyApp());
Main est la méthode qui permet de lancer une application en Dart.
Dans cette fonction on fait appel a la méthode *runApp* avec comme argument la classe qui va nous permettre de définir la base de notre application.
**RunApp** : cette méthode est la porte d’entrée d’une application Flutter.
Elle permet d’inflate(gonfler) la classe donnée en argument.
**MyApp()** : Dans cette classe, nous allons pouvoir définir plusieurs points importants de notre application.
* le titre de l’application
* le themes et les couleurs principales
* la navigation (homepage, routes…)
* etc.
*class*MyApp *extends*StatelessWidget
Vous avez peut être remarqué que cette classe MyApp() hérite de *Stateless* *Widget*. Dans une application Flutter, « tout est widget ».
Chaque élément visuel : bouton, texte, liste, hérite de la classe Widget. 
(Rien à voir avec un widget Android, c’est totalement différent.)
Il existe deux types de Widget, les **Statefull** et les **Stateless**.
Lorsqu’une vue est dynamique et a plus d’un état, par exemple une vue avec des cases à cocher, un formulaire à remplir… Il va être d’usage d’utiliser une classe qui hérite de *StatefullWidget*.
A l’inverse, une vue qui est fixe et n’aura aucun changement dans sa présentation sera Stateless.
Revenons à notre classe *MyApp*, on comprend désormais pourquoi elle hérite de *StatelessWidget*, dans cette classe on met juste en place des réglages de l’application, c’est un peu comme un manifest sur Android.
Dans cette classe on peut voir que la home est *MyHomePage*.
home: MyHomePage(title: ‘Flutter Demo Home Page’),
Ici on défini l’écran qui sera affiché lors de l’ouverture de l’application.
On instancie donc une classe, *MyHomePage* à laquelle on donne en argument un string qui sera ensuite le titre de cette page.
Si on scroll un peu, on arrive sur la classe *MyHomePage*. C’est donc la fameuse vue avec le bouton qui nous permet d’incrementer une valeur à chaque fois qu’il est touché. Etant donné cette interaction, c’est une classe qui étend *StatefullWidget*.
MyHomePage({Key key, *this*.title}) : *super*(key: key);
Examinons cette ligne. Ici on a un constructeur qui est celui appelé dans *MyApp()* et qui contient deux arguments, *key* et *title*.
**Key** : une *key* permet de contrôler comment un widget en remplace un autre. Pas besoin de se pencher dessus en détail pour le moment.
**Title**: C’est l’argument qui a été donné lors de l’intanciation de cette classe dans *MyApp*. On peut voir que MyHomePage contient une variable title.
*final*String title;
Avec*this.title*on initialise cette variable avec l’argument donné dans *MyApp*. 
NB : En Dart lorsque des paramètres sont entre brackets { } ils sont optionnels.
super(key: key)
Cette ligne permet d’appeler le constructeur de la classe de base d’un *StatefullWidget*, soit la classe *Widget* et de lui passer le paramètre *key*.
@override
_MyHomePageState createState() => _MyHomePageState();
Cette méthode permet de créer un état mutable pour le widget.
Il va falloir la redéfinir pour créer une nouvelle instance d’une sous-classe de ce état qui sera *_MyHomePageState*. 
MyHomePage sert donc à configurer l’état qu’aura notre StatefullWidget.
Nous allons donc passer à l’étude de cette sous-classe.
*class*_MyHomePageState *extends*State<MyHomePage>
On peut voir qu’elle hérite de la gestion de l’état de *MyHomePage*.
Cette classe sera obligée de redéfinir la méthode suivante.
Dans cette classe on a défini une variable _conter qui est la valeur affichée sur la vue. C’est donc cette valeur qui augmentera a chaque tap sur le bouton. On peut voir qu’après la définition de cette variable on voir une méthode *_incrementCounter*, c’est elle qui va avoir le travail d’augmenter de 1 la valeur de *_counter* à chaque tap. 
Si vous êtes développeur Android on peut se dire que ça serai la méthode appelée sur le onClick du bouton +. 
*void*_incrementCounter() {
  setState(() {_counter++;
  });
}
Dans cette méthode on appel *setState*, cette fonction permet de reconstruire la vue. Elle est appelée à chaque tap sur le bouton + et permet donc l’affichage de la nouvelle valeur de *_counter* dans la vue fraichement reconstruite. La méthode que le framework appel pour reconstruire la vue est la méthode *build*.
@override
Widget build(BuildContext context) {}
Cette méthode contient tout les éléments UI qu’on cherche à afficher sur notre vue. Nous allons passer sur tout les éléments de cette méthode et les détailler.
Cette méthode doit retourner un Widget, on va donc commencer par retourner un **Scaffold**.
Le **Scaffold** est comme sa traduction l’indique, un échafaudage sur lequel vous allez pouvoir poser tout les éléments de votre vue.
Cette échafaudage possède des emplacements pour des éléments UI standards sur un mobile. 

On peut donc définir **appBar**, soit la barre bleu en haut de notre vue ou il y a marqué « Flutter Demo Home Page » avec un Widget AppBar() qui est un widget prédéfini dans le framework Flutter qui permet déjà de mettre en place un titre, des icônes, une couleur, des actions …
Vous pouvez choisir de ne pas utiliser ce Widget et mettre un autre tant qu’il est de type PreferredSizeWidget.
On va maintenant donner un corps à notre vue.
Dans **body** on voit qu’il y a un widget **Center**, mais seul il n’affiche rien.
Rappelez vous tout est widget mais tout widget n’affiche pas quelque chose, ce type de widget est un layout widget.
Center accepte un widget en enfant qui sera centré horizontalement. Si je devais faire une comparaison avec Android je dirai que c’est un gravity. Sauf qu’il n’est pas un attribut d’un élément d’UI mais un élément a par entière qui contient l’élément qui sera centré.
Dans ce **Center** il y a un enfant, **Column**, lui aussi est un layout widget.
Column a comme paramètre mainAxisAlignement, celui ci avec son enum center va permettre de voir tout les enfants de Column centrés verticalement. Et si on rajoute la présence du parent de Column, Center, les enfants de Column seront aussi centré verticalement. N’hésitez pas a jouer avec les enums de mainAxisAlignement pour voir comment serai la vue avec d’autres réglages.
Column peut donc avoir plusieurs enfants de type Widget.
On va pouvoir déclarer les widget les uns après les autres.
En premier on a un Text, on peut lui donner un text mais aussi un style (couleur, fonte…), une direction, un nombre max de lignes …
Un widget Text doit forcement avoir un string non null.
Si on test de mettre null à la place du texte actuel vous aurez cet écran.
(Pomme + R sur un mac pour mettre à jour votre vue)
￼
Comme vous pouvez l’observer, avec Flutter quand il y a une erreur, le message s’affiche avec délicatesse et discrétion.
Remettez le text d’origine, ou ce que vous voulez, et refaites un reload, ça devrait aller mieux.
On a ensuite un deuxième widget Text dans notre Column, celui-ci affiche le nombre de tap sur le bouton donc il prend la variable _counter en argument. Ce widget a un style défini dans le framework.
style: Theme.of(context).textTheme.display1
Vous pouvez la aussi vous amuser avec le rendu, en mettant display4 par exemple.
Ensuite on a fini de visiter tout ce qui se trouvais dans le body de notre **Scaffold**. Maintenant nous voyons **floatingActionButton**.
C’est un bouton qui se trouve par défaut en bas a droite de votre téléphone et qui est fixe même lors d’un scroll. Vous pouvez le personnaliser comme vous le souhaitez, rien n’est figé, comme pour l’appbar vous pouvez mettre un autre widget à la place si vous voulez.
Le widget **FloatingActionButton** ici a trois de ses attributs définis. 

Le premier, **onPressed**, defini l’action qui se passe quand on tape sur ce bouton. Ici on a donné la méthode _incrementeCounter qu’on a vu plus haut dans cet article. 

Le **tooltip** est un indice visuel sur le widget qui s’affiche lorsqu’on appuie longtemps dessus.
![](post_2/Simulator-Screen-Shot-iPhone-11-Pro-Max-2019-11-21-at-11.56.50-473x1024.png)
Le child permet de mettre une Icône sur notre bouton, le framework possède déjà une bibliothèque d’icônes et c’est une de ces icônes qui est actuellement utilisé. Vous pouvez si vous le voulez mettre un texte aussi.
![](post_2/Capture-d%E2%80%99e%CC%81cran-2019-11-21-a%CC%80-12.05.16.png)child: Text(« Tap ici »),
