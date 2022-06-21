<script>
  import { onMount, getContext } from 'svelte'
  export let data
  export let style = {}
  const { getMap } = getContext('leaflet_map')
  const map = getMap()


    onMount(async () => {
      let L = await import('leaflet');
      let handler = await import('leaflet-path-drag');

      let rectangle = L.rectangle(data, style)

      if (map) {
        rectangle.bindPopup("You can drag me!");
        rectangle.addTo(map);
        console.log(rectangle.getCenter())
        // fire fly to center of rectangle after setView
        map.once('moveend',  (event) => {
          map.flyTo(rectangle.getCenter(), 14)
        });

        rectangle.on('mouseup', (event) => {
          // New coordinate of rectangle
          console.log(rectangle.getLatLngs())
          let coords = rectangle.getLatLngs()
          data = [[coords[0][0].lat, coords[0][0].lng],
                  [coords[0][2].lat, coords[0][2].lng]]
          console.log(data)
        })
      }
    })

</script>
