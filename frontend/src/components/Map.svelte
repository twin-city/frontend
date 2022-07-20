<script>
  import { onMount, setContext } from 'svelte'

  export let lat = 0
  export let lon = 0
  export let zoom = 6 // default zoom
  export let width = '100%'
  export let height = '100px'
  let container
  let map

  let bounds = [[48.90, 2.41],
                [48.82, 2.26]]

  setContext('leaflet_map', {
    getMap: () => map
  });

  $: style = `width:${width};height:${height};`

  onMount(async () => {
    let L = await import('leaflet');
    map = L.map(container, {drawControl: true}).setView([lat, lon], zoom)
    map.setMaxBounds(bounds);
    map.setMinZoom(zoom)
    map.setMaxZoom(17)
    return () => {
      map.remove()
    }
  })
</script>

<svelte:head>
    <link
    rel="stylesheet"
    href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
    integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
    crossorigin="" />
</svelte:head>

<div bind:this={container} style={style}>
  {#if map}
    <slot></slot>
  {/if}
</div>
