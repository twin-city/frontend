<script>
	//import '../app.css';
	import Header from '../layouts/Header.svelte';
	import Nav from '../layouts/Nav.svelte';
	import Footer from '../layouts/Footer.svelte';

	export let segment='/explore';
</script>

<svelte:head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="dsfr/dsfr.min.css">
	<link rel="stylesheet" href="dsfr/utility/utility.min.css">
	<meta name="theme-color" content="#000091"><!-- Défini la couleur de thème du navigateur (Safari/Android) -->
	<link rel="apple-touch-icon" href="dsfr/favicon/apple-touch-icon.png"><!-- 180×180 -->
	<link rel="icon" href="dsfr/favicon/favicon.svg" type="image/svg+xml">
	<link rel="shortcut icon" href="dsfr/favicon/favicon.ico" type="image/x-icon"><!-- 32×32 -->
	<link rel="manifest" href="dsfr/favicon/manifest.webmanifest" crossorigin="use-credentials">
	<!-- Modifier les chemins relatifs des favicons en fonction de la structure du projet -->
	<!-- Dans le fichier manifest.webmanifest aussi, modifier les chemins vers les images -->

	<script type="module" src="/dsfr/dsfr.module.min.js"></script>
	<script type="text/javascript" nomodule src="/dsfr/dsfr.nomodule.min.js"></script>
</svelte:head>

<Header/>
<Nav {segment} />
<main class="fr-container">
	<slot />
</main>
<Footer />

<style>

	@media (min-width: 480px) {
		footer {
			padding: 40px 0;
		}
	}
</style>
