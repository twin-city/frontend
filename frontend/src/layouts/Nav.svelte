<script>
export let segment;

function setSegment(e){
  console.log(e.target);
	segment = e.target.pathname;
  console.log(segment)
}

</script>
<nav class="fr-nav" id="header-navigation" role="navigation" aria-label="Menu principal">
  <div class="fr-container">
      <ul class="fr-nav__list">
				<li  class="fr-nav__item">
						<a on:click={setSegment} aria-current="{segment === '/' ? 'page' : undefined}" class="fr-nav__link" href="."  >Acceuil</a>
				</li>
				<li  class="fr-nav__item">
						<a on:click={setSegment} aria-current="{segment === '/about' ? 'page' : undefined}" class="fr-nav__link" href="about" >À propos</a>
				</li>
        <li  class="fr-nav__item">
            <a on:click={setSegment} aria-current="{segment === '/team' ? 'page' : undefined}" class="fr-nav__link" href="team" >Contributeurs</a>
        </li>
        <li  class="fr-nav__item">
            <a on:click={setSegment} aria-current="{segment === '/link' ? 'page' : undefined}" class="fr-nav__link" href="link" >Liens utiles</a>
        </li>
		</ul>
  </div>
</nav>
