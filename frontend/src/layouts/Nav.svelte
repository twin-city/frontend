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
						<a on:click={setSegment} aria-current="{segment === '/' ? 'page' : undefined}" class="fr-nav__link" href="."  >Home</a>
				</li>
				<li  class="fr-nav__item">
						<a on:click={setSegment} aria-current="{segment === '/about' ? 'page' : undefined}" class="fr-nav__link" href="about" >about</a>
				</li>
        <li  class="fr-nav__item">
            <a on:click={setSegment} aria-current="{segment === '/example' ? 'page' : undefined}" class="fr-nav__link" href="example" >example</a>
        </li>
        <li  class="fr-nav__item">
            <a on:click={setSegment} aria-current="{segment === '/explore' ? 'page' : undefined}" class="fr-nav__link" href="explore" >explore</a>
        </li>
		</ul>
  </div>
</nav>
