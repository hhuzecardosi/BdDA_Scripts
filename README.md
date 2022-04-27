# TP FINAL Bases de données avancées


## Le projet
Nous avons réalisé le projet en Python 3.9
Tous les tests ont étés réalisés sur la même machine et dans un environnement local
- 2021 Apple MacBook Pro (14 pouces, Puce Apple M1 Pro avec CPU 10 coeurs et GPU 16 coeurs, 16 Go RAM)
<hr/>

Le projet est découpé comme suit:
- `rendu/`
  - Il s'agit du premier rendu, avec notre schema a ce moment là et les contraintes d'intégrité de la base.
- 2 "notebook" Jupyter
  - `Import-via-copy-des-csv.ipynb`
    - Ce notebook permet de générer les fichiers csv depuis les données de l'INSEE et de les importer en base
    - La génération des csv passe par l'appel successif de 4 autres notebook gérants chacun respectivement:
      - Les communes
      - Les départements
      - Les régions
      - Les statistiques
    - `Questions.ipynb`
      - Ce notebook contient le code python utilisé pour rendre "lisible" les résultats de toutes les requêtes SQL (hors import) du TP
- `.env`
  - Il est OBLIGATOIRE de remplir le fichier .env (cf pré-requis)
- `sql/`
  - Ce dossier contient tous les fichiers SQL créés pour ce TP
  - `create.sql`
    - Ce fichier SQL permet de créer la base de données.
  - `questions/`
    - `reset.sql`
      - Permet "d'annuler" toutes les questions pour pouvoir les rejouer complètement si besoin
    - `question_n/`
      - ces sous dossiers contiennent les fichiers SQL relatifs aux questions (dans certains cas plusieurs questions sont regroupées comme les procédures qui s'étendent sur plusieurs questions)
- `remodelisations/`
  - Ce sont les notebooks jupyter permettant de générer les fichiers CSV de la resource qu'ils référencent (ie, communes.ipynb -> Communes)
  - Ces notebooks peuvent être lancés manuellements ou depuis le notbook `Import-via-copy-des-csv.ipynb`
- `csv/`
  - Contient les fichiers de base de l'INSEE
  - `filtered/`
    - C'est là que seront générés les CSV a partir des données de l'INSEE
- `classes/`
  - Répertoir des classes python créées à l'occasion du projet
- `backup/`
  - Contient les csv générés par nos scripts, ils sont a dispositions dans le cas ou il vous serait impossible de les générer vous-même
- `__init__.py`
  - Sert a python pour permettre l'import de nos classes personnelles
- `requirements.txt`
  - liste des dépendances du projets qu'il faut installer

## Pré requis
- Python 3 (Python 3.9 a été utilisé sur l'ensemble du projet)
- pip
- Jupyter OU si vous utilisez Visual Studio Code, l'extension : [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) (via ligne de commande: `code --install-extension ms-toolsai.jupyter`)
  - Il est nécéssaire de pouvoir visualiser le contenu des cellules du notebook pour voir nos résultats


## Installation
1. `cp .env.example .env`
2. Remplir les informations nécéssaires dans le `.env`
3. `pip3 install -r requirements.txt`
4. Avoir une base de données du même nom que celle renseignées dans le fichier `.env`

## Utilisation
Il y a 2 sections totalements différentes dans ce projet:
1. `Import-via-copy-des-csv.ipynb` et le contenu du dossier `remodelisations/`
   1. Il est impératif de lancer soit:
      1.  `Import-via-copy-des-csv.ipynb` seul
      2.  Chaque fichier du dossier `remodelisations/` indépendament puis `Import-via-copy-des-csv.ipynb` (cela dit ce dernier va lancer lui même les notebooks du dossier `remodelisations/`)
2. `Questions.ipynb`
   1. Qui contient le compte rendu de nos questions et fait appel à l'ensemble des fichiers sql présent dans `sql/questions` 
  
Il est important de noter que `Import-via-copy-des-csv.ipynb` doit être lancé avant `Questions.ipynb` sans quoi aucune données ne seront en base.

## Important: A propos de l'import des statistiques
Par défaut et pour le rendu nous importons l'ensemble des données statistiques fournies par l'INSEE.
Cela represente un nombre conséquent de données (~2.5M de lignes dans la table statistiques).
Si besoin de n'importer qu'une partie des données il suffit dans `remodelisations/statistiques.ipynb` d'enlever les dataframes des années que l'on ne souhaite pas importer. (La liste des dataframes est dans l'avant dernière cellule du fichier, contenu dans la variable `dfs`)


## Important: A propos des questions
Certaines requêtes sont "interactives", elles sont marquées par un commentaire en début de cellule `# requête interactive`.  
Cela signifie qu'il est possible de changer le contenu des variables situées juste en dessous de ce commentaire afin de jouer sur les résultats. Si vous n'avez pas lancé tout le notebook il suffit alors de relancer la cellule pour voir les résultats varier.  
Si tout le notebook a été lancé, la connection a postgres se ferme a la fin via l'appel de `postgres.close()`, il suffit soit d'ajouter une ligne en début de cellule `postgres.connect()`, soit de commenter la toute dernière cellule qui ferme la connexion ou bien simplement de relancer la 2ème cellule.
