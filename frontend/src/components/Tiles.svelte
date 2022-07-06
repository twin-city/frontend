<script>
  import { onMount, getContext } from 'svelte'
  export let url = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
  export let maxZoom = 19
  export let attribution = '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  const { getMap } = getContext('leaflet_map')

  const map = getMap()

  onMount(async () => {
    let L = await import('leaflet');
    if (map) {
      L.tileLayer(url, {
        maxZoom,
        attribution,
      }).addTo(map)
    }
  })


</script>
