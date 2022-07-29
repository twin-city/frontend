<svelte:head>
  <title>Accueil</title>
</svelte:head>


<h3>Le projet</h3>

<p>
<em>Élaborer des jumeaux numériques des villes françaises avec des moteurs
open-source de jeux vidéos/film d’animation, pour simuler les problèmes de
sécurité dans l’espace public.</em>
</p>

<p>Pour de prouver l'efficacité de la méthode, le premier problème posé est
celui du floutage de données à caractère personnel.
Le principe : générer des données synthétiques annotées pour entraîner
des algorithmes de détection d'objet, ici les véhicules, les personnes ainsi
que les fenêtres.
</p>

<h3>Démonstration</h3>

Une <a href='/demo'>page dédiée</a> vous permet de générer le quartier de votre choix à Paris, puis
de visualiser le rendu 3D du moteur de jeu.


<h3>Base de données</h3>




<p>Il s'agit d'images du jeu issues de 5 quartiers choisis.
</p>

<div class="fr-download fr-enlarge-link fr-download--card">
    <p>
        <a  href="https://dataset-full.s3.fr-par.scw.cloud/dataset-full.zip" download class="fr-download__link">Télécharger la base de données complète
            <span class="fr-download__detail">
                ZIP (JPG | JSON) – 628.2 Mo
            </span>
        </a>
    </p>
        <p class="fr-download__desc">RGB | Masques | boîtes de détection (COCO)</p>
</div>

Le quartier est construit et le jeu se lance. Des images annotées sont
extraites du moteur.


<div class='container'>
  <img width="560"  src="https://dataset-lp.s3.fr-par.scw.cloud/RGB3e8451c9-7ddb-43d9-ae89-90dfd9a010db/rgb_10.png">
  <img width="560"  src="https://dataset-lp.s3.fr-par.scw.cloud/SemanticSegmentation06070cb5-6e43-4253-82df-7c37fa2200ef/segmentation_10.png">
</div>
<br>


<h3>Principe de fonctionnement</h3>

<ol>
  <li>La première étape consiste à s'inspirer de la réalité pour construire
  un quartier.</li>
    <p>Grâce aux données ouvertes de
    <a title="Base de données Paris - ouvre une nouvelle fenêtre" href='https://opendata.paris.fr/pages/home/' target="_blank" rel="noopener">la mairie de Paris</a>
    et de l'IGN, des données sont récupérées telles que : </p>
      <ul>
        <li>🏘️ l'Emplacement des bâtiments, leurs hauteurs, année de construction et
        les matériaux.</li>
        <li>🛣️ Les routes, le sens de circulation et le nombre de voies,</li>
        <li>💡 La position des lampadaires et des potelets</li>
        <li>🌳 La position des arbres, leurs espèces et tailles. </li>
      </ul>
  <li>Ensuite, ces données transformées sont envoyés à
  <a title="Unity - ouvre une nouvelle fenêtre"   href='https://unity.com/fr' target="_blank" rel="noopener">Unity</a>, un éditeur
  de jeu vidéo, afin de construire un monde animé en 3D.</li>
  <ol>
    <li>De manière pseudo-réel et procédural, le quartier est généré.
    3 styles architecturaux ont été reproduits : Restauration, Haussmann et
    année trente.</li>
    <li>Puis les trottoirs, les piétons et les véhicules sont placés
    aléatoirement. </li>
    <li>Enfin, une dizaine de caméras sont positionnées de manière à capter
    des scènes pertinentes.</li>
  </ol>
  <li>La dernière étape consiste à lancer le jeu. Un module d'annotation nommé
   <a title="Perception/Unity - ouvre une nouvelle fenêtre" href="https://github.com/Unity-Technologies/com.unity.perception" target="_blank" rel="noopener">Perception</a>
   permet de sauvegarder pour chaque caméra :
   <ul>
     <li>L'image RGB original</li>
     <li>Le masque sémantique</li>
     <li>Les coordonnées des objets d'intérêt. Ici les piétons, les véhicules
     et les fenêtres. </li>
   </ul>
</li>
</ol>
<style>


.container {
  display: flex; /* or inline-flex */
  flex-direction: row;
  flex-wrap: wrap;
  justify-content:  space-between;
  align-items: center;
  margin-top: 2rem;
  margin-bottom: 2rem;
}
</style>
