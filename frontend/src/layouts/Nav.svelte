<svelte:head>
  <link href="dsfr/core/core.min.css" rel="stylesheet">
  <link href="dsfr/component/link/link.min.css" rel="stylesheet">
  <link href="dsfr/component/button/button.min.css" rel="stylesheet">
  <link href="dsfr/component/navigation/navigation.min.css" rel="stylesheet">

  <script type="text/javascript" nomodule href="dsfr/legacy/legacy.nomodule.min.js" ></script>
  <script type="module" href="dsfr/core/core.module.min.js" ></script>
  <script type="text/javascript" nomodule href="dsfr/core/core.nomodule.min.js" ></script>
  <script type="module" href="dsfr/component/navigation/navigation.module.min.js" ></script>
  <script type="text/javascript" nomodule href="dsfr/component/navigation/navigation.nomodule.min.js" ></script>
</svelte:head>



<nav class="fr-nav" id="header-navigation" role="navigation" aria-label="Menu principal">
  <div class="fr-container">
      <ul class="fr-nav__list">
				<li class="fr-nav__item">
						<a class="fr-nav__link" href="/"  aria-current="page">Home</a>
				</li>
				<li class="fr-nav__item">
						<a class="fr-nav__link" href="/about" >about</a>
				</li>
        <li class="fr-nav__item">
            <a class="fr-nav__link" href="/example" >example</a>
        </li>
		</ul>
  </div>
</nav>
