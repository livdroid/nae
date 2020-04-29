# **Flutter #3 : Dart, partie 2**
#_liv/flutter

Dans la premiere partie nous avons eu une petite introduction au langage Dart avec les variables. Ici nous allons voir comment faire des fonctions et des conditions.
### Fonctions
On a vu dans l’article précédent comment démarrai un programme en Dart avec la fonction main. Pour rappel : 
void main(){}
On peut déjà voir que pour construire une fonction, on démarre avec le type qu’elle retourne. Quand elle ne retourne rien il est possible d’écrire *void*ou rien du tout.
void test(){}
//s’écrit aussi
test(){}
Prenons le code suivant :
main() {
  showAName(« Sylvia »);
}
On appelle une fonction depuis *main* avec en argument un String.
Il faudra donc déclarer la fonction*showAName*.
showAName(String s) {
  print(« My name is «  + s);
}
Ici on a donc une fonction qui prend en argument un string, qui s’écrit de la manière suivante : Type nomVariable.
Et si on souhaite que notre fonction retourne une donnée ? 
Dans main on ajoute :
var age = 20;
var yearOfBirth = showBirthYearFromAge(age);
print(yearOfBirth);
La variable *yearOfBirth* contiendra la valeur retournée par la fonction *showBirthYearFromAge* qui prend en argument un entier (*int*).
int showBirthYearFromAge(int age) {
  var currentYear = DateTime.now().year;
  return currentYear - age;
}
Ici on commence donc l’écriture de la fonction avec le type de valeur qu’elle va retourner. On récupère l’année en cours et on retourne le résultat de l’année en cours moins l’age donné en argument.
Il est possible d’écrite une fonction courte comme celle ci sur une seule ligne.
int showBirthYearFromAge(int age) => DateTime.now().year - age;
Dans Flutter on utilisera beaucoup de fonction qui retournes des Widget (éléments visuels d’une interface) pour plus de lisibilité. 
### Conditions
var name = « Sophia »;
var letterToCheck = « a »;

if (name.contains(letterToCheck)) {
  print(« Sophia possede la lettre $letterToCheck »);
} else {
  print(« Sophia ne possède pas la lettre $letterToCheck »);
}
Rien de bien nouveau ou différent sur le *if else* en Dart.
Si besoin vous pouvez faire cette condition en Elvis Operator.
name.contains(letterToCheck)
    ? print(« Sophia possede la lettre $letterToCheck »)
    : print(« Sophia ne possède pas la lettre $letterToCheck »);
Vous pouvez checker le type d’une variable si besoin, pratique pour les *dynamic*.
dynamic x = 3;
x = « Sophia »;
if (x is String) {
  print(« x variable is a string »);
}
Il existe aussi le *do while*. La valeur de *value1* determine la repetition ou non du code dans le *do*. Dans tout les cas le code dans le *do* est exécuté au moins une fois.
var value1 = true;
do {
  print(« Une operation dans do »);
  value1 = false;
} while (value1);
Si vous souhaitez arrêter dans un *while* il est possible d’ajouter un *break*. Ce mot clé va nous servir ensuite pour un autre type de test de condition.
var value2 = true;
while (true) {
  if (value2); 
  break;
  print(« Ce message ne s’affiche que si value2 est faux »);
}
Il y a aussi le *case switch*. On test les valeurs possibles d’une variable et on execute un code dès que cette valeur est rencontrée, afin de ne pas continuer à tester toutes les autres conditions une fois que la bonne à été trouvée, on ajoute un *break* afin de stopper la condition après la fonctionnalité à faire.
var command = ‘OPEN’;
switch (command) {
  case ‘CLOSED’:
    print(‘CLOSED’);
    break;
  case ‘OPEN’:
    print(‘OPEN’);
    break;
  default:
    print(‘OTHER’);
}
