<svelte:head>
  <title>Welcome</title>
</svelte:head>

<script>
	import Map from '../components/Map.svelte';
  import Tiles from '../components/Tiles.svelte';
  import Geojson from '../components/Geojson.svelte';
  import Webgl from '../components/Webgl.svelte';
  //import ImageViewer from '../components/ImageViewer.svelte';

  var geojsonStyle = {
    "color": "#0307fc",
    "weight": 1,
    "opacity": 0.65,
    "draggable": true
  };

  var data = [[48.87383277515822,2.318927841186461],
              [48.875557367974324,2.32152458190907]]

  var data = [[48.8644, 2.3977],
              [48.8655, 2.3994]]


  let disabled = false ; //button interaction
  let buildUrl = "https://webgl-lp.s3-website.fr-par.scw.cloud/Build"
  function generateWebgl() {
    disabled = true // Disable button interaction
    console.log(data)
    alert(`Coordinates are : ${data}`)
    // TODO: Call api
    // body = fetch(/api/webgl...)
    // buildUrl = body.buildUrl
  }
</script>

<h1>Le projet</h1>

<p>
<em>Explorer le potentiel de l'intelligence artificielle grâce
aux jumeaux numériques de villes.</em>
</p>

<p>Pour de prouver l'efficacité de la méthode, le premier problème posé est le floutage
de véhicules, de personnes et de fenêtres.
Il s'agit donc de générer des données synthétiques annotées pour le floutage.
</p>

<h1>Démonstration</h1>

<h2>Génénaration de quartiers à Paris dans un moteur de jeu</h2>

<p>Faites glisser le carré bleu sur la carte de Paris de manière à sélectionner
un quartier. Puis valider votre choix en appuyant sur le bouton çi-dessous.
</p>

<div class="fr-highlight">
    <p>Cette action peut prendre jusqu'à 10 minutes!
    </p>
</div>

<button on:click={generateWebgl} disabled='{disabled}' class="fr-btn fr-fi-checkbox-circle-line fr-btn--icon-left">
    Générer !
</button>




<div class='container'>
<Map width="35rem" height="30rem" lon={2.33} lat={48.86} zoom={11.4}>
  <Tiles />
  <Geojson bind:data style={geojsonStyle}/>
</Map>

<Webgl buildUrl={buildUrl} width="35rem" height="30rem" />
</div>
<div class="fr-highlight">
    <p>La touche C permet de changer de caméra,
    La touche J passe en caméra libre.
    </p>
</div>

<h2>Récupération des images annotées</h2>

Le quartier est construit et le jeu tourne en boucle. Des images annotées sont
extraites du moteur.



<div class='container'>

<img width="560"  src="https://dataset-lp.s3.fr-par.scw.cloud/RGB3e8451c9-7ddb-43d9-ae89-90dfd9a010db/rgb_10.png">
<img width="560"  src="https://dataset-lp.s3.fr-par.scw.cloud/SemanticSegmentation06070cb5-6e43-4253-82df-7c37fa2200ef/segmentation_10.png">

</div>

<div class="fr-download fr-enlarge-link fr-download--card">
    <p>
        <a href="[À MODIFIER]" download class="fr-download__link">Télécharger la base de données complète.
            <span class="fr-download__detail">
                JPG | JSON – 230,41 Mo
            </span>
        </a>
    </p>
        <p class="fr-download__desc">RGB | Masques | boîtes de détection (COCO)</p>
</div>

<br>


<h1>Comment ça marche?</h1>

<ol>
  <li>La première étape consiste à s'inspirer de la réalité pour construire
  un quartier.</li>
    <p>Grâce aux données ouvertes de
    <a href='https://opendata.paris.fr/pages/home/'>la mairie de Paris</a>
    et de l'IGN, des données sont récupérées telles que : </p>
      <ul>
        <li>🏘️ l'Emplacement des bâtiments, leurs hauteurs, année de construction et
        les matériaux.</li>
        <li>🛣️ Les routes, le sens de circulation et le nombre de voies,</li>
        <li>💡 La position des lampadaires et des potelets</li>
        <li>🌳 La position des arbres, leurs espèces et tailles. </li>
      </ul>
  <li>Ensuite, ces données transformées sont envoyés à
  <a href='https://unity.com/fr'>Unity</a>, un éditeur
  de jeu vidéo, afin de construire un monde animé en 3D.</li>
  <ol>
    <li>De manière pseudo-réel et procédural, le quartier est généré.
    3 styles architécturaux ont été reproduits : Restauration, Haussmann et
    année trente.</li>
    <li>Puis les trottoirs, les piétons et les véhicules sont placés
    aléatoirement. </li>
    <li>Enfin, une dizaine de caméras sont positionnées de manière à capter
    des scènes pertinentes.</li>
  </ol>
  <li>La dernière étape consiste à lancer le jeu. Un module d'annotation nommé
   <a href="https://github.com/Unity-Technologies/com.unity.perception">Perception</a>
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
