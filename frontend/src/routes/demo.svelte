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

  let displayWebgl = 0 ;
  function generateWebgl() {
    disabled = true // Disable button interaction
    console.log(data)
    //alert(`En cours de développement`)
    // TODO: Call api
    // body = fetch(/api/webgl...)
    // buildUrl = body.buildUrl
  }

</script>


<h3>Génération de quartiers à Paris dans un moteur de jeu</h3>

<p>Faites glisser le carré bleu sur la carte de Paris de manière à sélectionner
un quartier. Puis valider votre choix en appuyant sur le bouton çi-dessous.
</p>

<div class="fr-highlight">
    <p>Cette action peut prendre jusqu'à 10 minutes!
    </p>
</div>


{#if disabled}
  <div class="fr-alert fr-alert--warning">
    <p class="fr-alert__title">Indisponible</p>
    <p>En cours de développement. Vous pouvez cependant charger le quartier
    par défaut.</p>
  </div>
{/if}

<div class='container'>
  <div>

    <Map width="35rem" height="30rem" lon={2.33} lat={48.86} zoom={11.4}>
      <Tiles />
      <Geojson bind:data style={geojsonStyle}/>
      <button on:click={generateWebgl} disabled='{disabled}' id="overlayButton" class="fr-btn fr-fi-checkbox-circle-line fr-btn--icon-left">
          Générer !
      </button>
    </Map>

</div>
{#if displayWebgl === 2}
  <Webgl buildUrl={buildUrl} width="35rem" height="30rem" />

{:else if displayWebgl === 1}
  <div class='webglPlaceholder'>
    <div class="fr-callout fr-fi-information-line">
      <p class="fr-callout__title">Ressources</p>
      <p class="fr-callout__text">
      300Mo vont être chargé sur votre navigateur, il faut un bon
      réseau internet et de optimalement une carte graphique.
      </p>
      <ul class="fr-btns-group fr-btns-group--inline">
       <li>
          <button on:click={() => displayWebgl = 2} class="fr-btn fr-fi-checkbox-circle-line fr-btn--icon-left">
              Confirmer
          </button>
        </li>
        <li>
          <button on:click={() => displayWebgl = 0}  class="fr-btn fr-icon-arrow-go-back-fill fr-btn--icon-left">
              Annuler
          </button>
        </li>
      </ul>
    </div>

  </div>

{:else}
  <div class='webglPlaceholder'>
    <button on:click={() => displayWebgl = 1} id="overlayButton" class="fr-btn fr-fi-checkbox-circle-line fr-btn--icon-left">
        Charger le monde 3D
    </button>
  </div>
{/if}

</div>
<div class="fr-highlight">
    <p>La touche C permet de changer de caméra,
    La touche J passe en caméra libre.
    </p>
</div>


<h3>Récupération des données</h3>

<p>Les images prises par les caméras et les annotations sont extraites du jeu.</p>

<div class="fr-download">
  <div class="fr-alert fr-alert--error">
    <p class="fr-alert__title">Indisponible</p>
    <p>Unity ne reconnaît pas les cartes graphiques sans moniteur physique,
    impossible pour le moment de lancer le jeu sur un serveur et récupérer
    les images </p>
    </div>
    <p>
        <a  download class="fr-download__link">Télécharger les images du quartier
            <span class="fr-download__detail">
                JPG | JSON – 10 Mo
            </span>
        </a>
    </p>
</div>


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
.button {
  position:relative;
}
.webglPlaceholder {
  width: 35rem;
  height: 30rem;
  position: relative;
  background-image:
    url("https://dataset-lp.s3.fr-par.scw.cloud/RGB3e8451c9-7ddb-43d9-ae89-90dfd9a010db/rgb_20.png")
}
#overlayButton{
    display: flex;
    align-items: center;
    position: absolute;
    top: 20px;
    right: 20px;
    text-align: center;
    z-index: 500;
}

</style>
