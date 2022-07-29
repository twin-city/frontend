<svelte:head>
  <title>L'équipe</title>
</svelte:head>

<h3>L'équipe actuelle</h3>
<!-- https://gouvfr.atlassian.net/wiki/spaces/DB/pages/222331438/Tuile+-+Tile-->
<!-- Tuiles horizontales placées dans la grille -->
<!-- Tuiles verticales placées dans la grille -->

<div class="fr-grid-row fr-grid-row--gutters">
    <div class="fr-col-6 fr-col-md-4 fr-col-lg-3">
        <div class="fr-tile fr-enlarge-link">
            <div class="fr-tile__body">
                <h4 class="fr-tile__title">
                    <a class="fr-tile__link" href>Tristan Solus</a>
                </h4>
                <p class="fr-tile__desc">Stagiaire Master 1 à L'ESILV, option Data Science et Intelligence Artificielle. </p>
            </div>
            <div class="fr-tile__img">
                <img src="avatar/tristan.jpeg" class="fr-responsive-img avatar" alt="">
            </div>
        </div>
    </div>
    <div class="fr-col-6 fr-col-md-4 fr-col-lg-3">
        <div class="fr-tile fr-enlarge-link">
            <div class="fr-tile__body">
                <h4 class="fr-tile__title">
                    <a class="fr-tile__link" href>Lucas Guerrero</a>
                </h4>
                <p class="fr-tile__desc">Stagiaire Master 2 Informatique à la Faculté Jean Perrin, option Ingénieur pour les Jeux Vidéos.</p>
            </div>
            <div class="fr-tile__img">
                  <img src="placeholder.png" class="fr-responsive-img avatar" alt="">
            </div>
        </div>
    </div>
    <div class="fr-col-6 fr-col-md-4 fr-col-lg-3">
        <div class="fr-tile fr-enlarge-link">
            <div class="fr-tile__body">
                <h4 class="fr-tile__title">
                    <a class="fr-tile__link" href>Pierre-Louis Bouchez</a>
                </h4>
                <p class="fr-tile__desc">Stagiaire Master 2 Informatique à la Faculté Jean Perrin, option Ingénieur pour les Jeux Vidéos.</p>
            </div>
            <div class="fr-tile__img">
                <img src="avatar/pl.png" class="fr-responsive-img avatar" alt="">
                <!-- L'alternative de l'image (attribut alt) doit à priori rester vide car l'image est illustrative et ne doit pas être restituée aux technologies d’assistance. Vous pouvez toutefois remplir l'alternative si vous estimer qu'elle apporte une information essentielle à la compréhension du contenu non présente dans le texte -->
            </div>
        </div>
    </div>
    <div class="fr-col-6 fr-col-md-4 fr-col-lg-3">
        <div class="fr-tile fr-enlarge-link">
            <div class="fr-tile__body">
                <h4 class="fr-tile__title">
                    <a class="fr-tile__link" href>Victor Journé</a>
                </h4>
                <p class="fr-tile__desc">Data Scientist</p>
            </div>
            <div class="fr-tile__img">
                <img src="avatar/victor.jpeg" class="fr-responsive-img avatar" alt="">
                <!-- L'alternative de l'image (attribut alt) doit à priori rester vide car l'image est illustrative et ne doit pas être restituée aux technologies d’assistance. Vous pouvez toutefois remplir l'alternative si vous estimer qu'elle apporte une information essentielle à la compréhension du contenu non présente dans le texte -->
            </div>
        </div>
    </div>
</div>

<br>

<h3>Les futurs Entrepreneurs d'intérêt général</h3>

<p>Le projet EIG
    <a title="intitulé lien externe - ouvre une nouvelle fenêtre" href="https://eig.etalab.gouv.fr/defis/twincity/" target="_blank" rel="noopener">
    TwinCity </a>
commence mi septembre.</p>


<style>
.avatar {
  border-radius: 30%;
}
</style>
