# Notes sur la couverture de code (JaCoCo)

Résultat obtenu avec `mvn test jacoco:report` sur la classe `Rating` :
**Instructions : 94.0 %** | **Branches : 100 %** | **Lignes : 92.9 %** | **Méthodes : 75 %**.

La seule partie non couverte est la méthode `getRatingCount()`, jamais appelée
par les tests actuels (elle sert uniquement d'accesseur secondaire). Toutes
les branches conditionnelles de `addRating` et `getAverageRating` (bornes 1-5,
liste vide) sont en revanche couvertes à 100 %.

Ce que la couverture montre : que chaque ligne et chaque branche de décision
du code métier a été exécutée au moins une fois par un test, ce qui donne un
bon niveau de confiance que le code n'est pas mort et que les chemins
principaux (nominal, limites, erreurs) sont exercés.

Ce que la couverture NE prouve PAS : elle ne garantit ni l'absence de bugs
logiques, ni la pertinence des assertions. Un test peut exécuter une ligne
sans vérifier correctement son résultat (assertion trop faible ou absente),
et 100 % de couverture n'empêche pas des cas métier non envisagés (ex. valeurs
flottantes, très grands volumes de notes, comportement concurrent) de rester
non testés.
