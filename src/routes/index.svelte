<svelte:head>
  <title>Welcome</title>
</svelte:head>

<script>
	import Map from '../components/Map.svelte';
  import Tiles from '../components/Tiles.svelte';
  import Geojson from '../components/Geojson.svelte';

  var geojsonStyle = {
    "color": "#0307fc",
    "weight": 1,
    "opacity": 0.65,
    "draggable": true
  };

  var data = [[48.87383277515822,2.318927841186461],
              [48.875557367974324,2.32152458190907]]

</script>

<h1>Hello and welcome to my site!</h1>


<Map width="25rem" height="20rem" lon={2.33} lat={48.86} zoom={11.4}>
  <Tiles />
  <Geojson bind:data style={geojsonStyle}/>
</Map>

<p>{data}</p>
<a href="/about">About my site</a>
