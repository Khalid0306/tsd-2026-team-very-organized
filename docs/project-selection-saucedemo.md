# Sélection du projet — Lab 2

## 1. Application choisie : SauceDemo

**URL :** https://www.saucedemo.com/

SauceDemo est une application e-commerce de démonstration publiée par Sauce
Labs, spécifiquement conçue pour l'entraînement au test logiciel (manuel et
automatisé). Elle est un bon choix pour ce cours car :

- Elle est **publique et stable** : pas d'authentification tierce, pas de
  données réelles, pas de risque légal ou de rate-limiting agressif.
- Ses **comportements sont prévisibles et documentés** : les scénarios
  (login, catalogue, panier, checkout) ne changent pas d'une session à
  l'autre.
- Elle fournit volontairement des **comptes de test avec bugs intégrés**,
  ce qui est idéal pour illustrer des cas de test négatifs :
  - `standard_user` : compte nominal, tout fonctionne.
  - `locked_out_user` : compte verrouillé, le login doit échouer avec un
    message d'erreur explicite — parfait pour un test négatif de login.
  - `problem_user` : produit des bugs d'affichage (images, tri) —
    permet de tester la détection de régressions visuelles/fonctionnelles.
  - `performance_glitch_user` : introduit un délai artificiel — utile
    pour des tests de patience/timeout.
  - Mot de passe commun à tous : `secret_sauce`.

## 2. Cinq fonctionnalités testables

| # | Fonctionnalité | Description |
|---|-----------------|--------------|
| 1 | **Login** | Authentification avec comptes valides, invalides, et comptes spéciaux (`locked_out_user`, `problem_user`) |
| 2 | **Catalogue produits** | Affichage des 6 produits, tri (nom A-Z/Z-A, prix croissant/décroissant) |
| 3 | **Ajout au panier** | Ajout/retrait de produits, mise à jour du compteur panier |
| 4 | **Checkout** | Formulaire d'informations (prénom, nom, code postal), validation des champs obligatoires, récapitulatif de commande |
| 5 | **Déconnexion / session** | Logout, expiration de session, redirection vers login si accès direct à une page protégée sans être authentifié |

## 3. Test manuel vs automatisable

| Fonctionnalité | Manuel | Automatisable (Selenium/Robot) | Justification |
|---|---|---|---|
| Login | Oui | Oui — priorité haute | Scénarios répétitifs (positif/négatif/comptes verrouillés), forte valeur ROI en automatisation, peu de subjectivité |
| Catalogue produits (tri) | Oui | Oui | Le tri produit un ordre déterministe vérifiable par assertion sur l'ordre des éléments DOM |
| Ajout au panier | Oui | Oui | Actions UI simples et stables (clics, compteur), bon candidat pour Selenium |
| Checkout (validation champs) | Oui (surtout exploratoire) | Partiellement | Les cas nominaux et les erreurs de champ vide sont automatisables ; les aspects ergonomiques/visuels (positionnement des messages d'erreur, lisibilité) restent mieux évalués manuellement |
| Déconnexion / session | Oui | Oui | Vérification simple de redirection et d'état de session, bon candidat pour un test automatisé de non-régression |

En résumé : les scénarios avec assertions objectives et binaires (le champ
X est présent, le tri est correct, la redirection a lieu) sont automatisables
en priorité. Les aspects visuels/UX fins restent du ressort du test manuel
exploratoire.

## 4. Disponibilité d'une API pour SauceDemo

Vérification effectuée (recherche web) : **SauceDemo (saucedemo.com) n'expose
aucune API REST publique**. C'est une application purement front-end
(HTML/JS statique) conçue uniquement pour piloter l'interface via un
navigateur ; il n'y a pas de backend interrogeable directement en HTTP/JSON.

**Conséquence pour le Lab 6 (Postman) :** il faudra utiliser une API
publique alternative pour les exercices Postman. Deux options simples :

- **reqres.in** — API de test REST classique (GET/POST/PUT/DELETE sur des
  ressources `users`), réponses JSON prévisibles, aucune authentification
  requise. Bon choix par défaut, léger et rapide à prendre en main.
- Une **API mockée locale** (ex. via `json-server` ou Postman Mock Server)
  si l'on veut un contrôle total sur les réponses et éviter toute
  dépendance à un service tiers dont la disponibilité n'est pas garantie.

*Point à trancher avec l'enseignant ou en équipe : confirmer que reqres.in
(ou équivalent) est acceptable pour le Lab 6, puisque SauceDemo ne convient
pas pour cette partie.*

## 5. Risques

- **App de démo pouvant changer sans préavis** : Sauce Labs peut modifier
  l'UI, les comptes de test ou même retirer le service à tout moment,
  cassant les tests automatisés sans avertissement.
- **Absence de vraie API** : impossible de valider les données côté
  backend (les tests reposent entièrement sur l'état du DOM affiché),
  ce qui limite la profondeur des vérifications possibles.
- **Dépendance à l'état du navigateur/session** : les tests Selenium
  peuvent être fragiles face aux temps de chargement, cookies résiduels,
  ou différences de comportement entre navigateurs/versions.
- **Données non persistantes** : le panier et la session ne survivent pas
  entre exécutions indépendantes (pas de vraie base de données), donc
  chaque test doit repartir d'un état propre (nouveau login), ce qui ajoute
  de la redondance dans les scripts de test.
