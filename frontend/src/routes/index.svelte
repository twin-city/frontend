<svelte:head>
  <title>Welcome</title>
</svelte:head>

<script>
	import Map from '../components/Map.svelte';
  import Tiles from '../components/Tiles.svelte';
  import Geojson from '../components/Geojson.svelte';
  import Webgl from '../components/Webgl.svelte';

  var geojsonStyle = {
    "color": "#0307fc",
    "weight": 1,
    "opacity": 0.65,
    "draggable": true
  };

  var data = [[48.87383277515822,2.318927841186461],
              [48.875557367974324,2.32152458190907]]

  let disabled = false ; //button interaction
  function generateWebgl() {
    disabled = true // Disable button interaction
    console.log(data)
  }
</script>

<h1>Le projet</h1>

<p>Explorer le potentiel de l'intelligence artificielle grâce
aux jumeaux numériques de villes.
</p>

<h1>Démonstratation</h1>

<p>Faites glisser le carré bleu sur la carte de Paris de manière à sélctionner
un quartier. Puis valider votre choix en appuyant sur le bouton çi-dessous. Cela
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


 <Webgl  width="35rem" height="30rem" />
</div>



<p>{data}</p>


<h1>Comment ça marche?</h1>

<style>
.container {
  display: flex; /* or inline-flex */
  flex-direction: row;
  flex-wrap: wrap;
  justify-content:  space-between;
  align-items: center;
}
</style>
