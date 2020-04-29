# Introduction à Flutter, the Dart side of mobile programming
#flutter

Open source

Designé pour fonctionner sur Fuchsia OS
Applications Flutter pour : iOS, android, fuschia, Mac, linux et peut être windows
## Est-ce vraiment du cross plateforme ?

‘unidirectional data flow’ architecture, or reactive programming

Flutter n’utilise pas vraiment les « sous couches » d’android/ios, pour tout ce qui est hardware (camera, bluetooth) il faut sa propre popote. 
Ecrit directement ses interfaces graphiques via Skia Engine (Engine de chrome depuis des années)

### Approche cross plateforme classique 
![](Introduction%20a%CC%80%20Flutter,%20the%20Dart%20side%20of%20mobile%20programming/1*sN5qLPk343XzYMpzZ1EWYQ.png)
Le passage par des librairies du SDK limite les performances. C’est un gros soucis sur les projet cross plateforme, dès qu’ils deviennent conséquents.

### Approche Flutter

![](Introduction%20a%CC%80%20Flutter,%20the%20Dart%20side%20of%20mobile%20programming/1*5QX7BsNvb8Z8y-f-bYY9Wg.png)

Flutter utilise le binaire ARM, c’est compilé ahead of time, pas besoin de jvm.
compiled ahead-of-time into native ARM code
L’engine Skia est compilé dans l’app directement donc déjà en binaire.
This gives better performance because there’s no JS bridge in the middle to parse and execute the code.
*Plateforme channels :* 
Flutter contient directement les widget stock de chaque plateformes mobiles, du coup bonne performances et graphisme typique a chaque plateforme, l’utilisateur n’est pas perdu.
Permet de mettre en place des interfaces graphiques récentes sur des vieux téléphones.
Cupertino/Material
Sur Android la class View, qui est la classe mère de tout les éléments graphiques fait plus de 26k lignes.
Android utilise l’heritage, Flutter utilise la composition. (Préciser)

## Dart 
Facile a approcher.
Ui code prend des décision sur quoi afficher, par exemple selon le résultat de la requête d’un framework.
Une application Flutter avec requête à une Api REST,  parking de JSON et affichage du résultat dans une list view (recyclerview de flutter) prend 150 lignes environ. UI inclue. Par une personne débutante en Flutter.

Actuellement on est en a Dart 2.1

Sources : 
https://hackernoon.com/whats-revolutionary-about-flutter-946915b09514

[Flutter: the good, the bad and the ugly – The ASOS Tech Blog – Medium](https://medium.com/asos-techblog/flutter-vs-react-native-for-ios-android-app-development-c41b4e038db9)

https://medium.com/flutter-community/porting-a-75-000-line-native-ios-app-to-flutter-57c6571c57b4


Portage d’une application IOS à plus d’un million de téléchargement 
60,000 lignes

Vers flutter :

30, 000 lignes
Moins de 6 mois
Pas de retours de perte de perf par les testeurs

+
 Flutter does its own UI drawing
Hot reloading
state
Asynchronous programming with async/await/Future + dart
Flutter and Dart have built-in support for both unit testing for logic, and widget testing for UI/interactions
built-in support for theming

-

Flutter paints the UI on its own custom way, it doesn’t create native components.
 nowhere as rich as the plugins you can find for React Native and even Xamarin.
Debugging is not at its best.
The error screen 
Creating the UI programmatically 

B2B/MVP


