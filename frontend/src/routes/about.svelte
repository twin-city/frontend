<svelte:head>
  <title>About</title>
</svelte:head>

<h1>L'équipe</h1>
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
                <p class="fr-tile__desc">Stagiaire au pôle Léonard de Vinci</p>
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
                    <a class="fr-tile__link" href>Lucas Guerrerero</a>
                </h4>
                <p class="fr-tile__desc">Stagiaire Master Informatique à l'Université de Lens</p>
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
                <p class="fr-tile__desc">Stagiaire Master Informatique à l'Université de Lens</p>
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
<h1>Liens utiles</h1>

<h2>Les projets proches de TwinCity</h2>

<div class="fr-grid-row fr-grid-row--gutters">
  <div class="fr-col-6 fr-col-md-4 fr-col-lg-6">
    <div class="fr-card fr-enlarge-link">
        <div class="fr-card__body">
            <div class="fr-card__content">
                <h4 class="fr-card__title">
                    <a href="http://carla.org">CARLA</a>
                </h4>
                <p class="fr-card__desc">Banc d'essai virtuel pour tester les
                les pilotes de véhicules autonome. Projet européen open-source
                développé avec Real Engine.</p>
                <!-- <div class="fr-card__end">
                    <p class="fr-card__detail fr-icon-warning-fill">détail (optionnel)</p>
                </div> -->
            </div>
        </div>
        <div class="fr-card__header">
            <div class="fr-card__img">
              <img src="https://carla.readthedocs.io/en/latest/img/objects_small.gif" class="fr-responsive-img" alt="">
                <!-- L’alternative de l’image (attribut alt) doit toujours être présente, sa valeur peut-être vide (image n’apportant pas de sens supplémentaire au contexte) ou non (porteuse de texte ou apportant du sens) selon votre contexte -->
            </div>
        </div>
      </div>
  </div>
  <div class="fr-col-6 fr-col-md-4 fr-col-lg-6">
      <div class="fr-card fr-enlarge-link">
          <div class="fr-card__body">
              <div class="fr-card__content">
                  <h4 class="fr-card__title">
                      <a href="http://synthia-dataset.net/">SYNTHIA Dataset</a>
                  </h4>
                  <p class="fr-card__desc">L'équipe de Carla, deux ans plus tôt, on
                  mis à disposition un jeu de données synthétiques pour aider
                  les algorithmes de traitement d'images pour la voiture autonome.</p>
                  <!-- <div class="fr-card__end">
                      <p class="fr-card__detail fr-icon-warning-fill">détail (optionnel)</p>
                  </div> -->
              </div>
          </div>
          <div class="fr-card__header">
              <div class="fr-card__img">
              <img src="http://synthia-dataset.net/wp-content/uploads/2016/06/randcityscapes-e1569359521511.png" class="fr-responsive-img" alt="">
                  <!-- L’alternative de l’image (attribut alt) doit toujours être présente, sa valeur peut-être vide (image n’apportant pas de sens supplémentaire au contexte) ou non (porteuse de texte ou apportant du sens) selon votre contexte -->
              </div>
          </div>
        </div>
  </div>
  <div class="fr-col-6 fr-col-md-4 fr-col-lg-6">
        <div class="fr-card fr-enlarge-link">
            <div class="fr-card__body">
                <div class="fr-card__content">
                    <h4 class="fr-card__title">
                        <a href="https://www.spirops.com/">SpirOps</a>
                    </h4>
                    <p class="fr-card__desc">Une compagnie privée en intelligence
                    artificielle, qui mêle le jeu vidéo à ses recherches.</p>
                    <!-- <div class="fr-card__end">
                        <p class="fr-card__detail fr-icon-warning-fill">détail (optionnel)</p>
                    </div> -->
                </div>
            </div>
            <div class="fr-card__header">
                <div class="fr-card__img">
                  <video  class="fr-responsive-img" alt="">
                    <source src="https://www.spirops.com/img/crowd_overview_426_240.mp4">
                  </video>
                </div>
            </div>
          </div>
  </div>
  <div class="fr-col-6 fr-col-md-4 fr-col-lg-6">
          <div class="fr-card fr-enlarge-link">
              <div class="fr-card__body">
                  <div class="fr-card__content">
                      <h4 class="fr-card__title">
                          <a href="https://npm3d.fr/">NPM3D</a>
                      </h4>
                      <p class="fr-card__desc">Jeux de nuages de points de villes françaises, pour du Lidar.</p>
                      <!-- <div class="fr-card__end">
                          <p class="fr-card__detail fr-icon-warning-fill">détail (optionnel)</p>
                      </div> -->
                  </div>
              </div>
              <div class="fr-card__header">
                  <div class="fr-card__img">
                    <img src="https://npm3d.fr/storage/pages/November2021/soufflot.jpg" class="fr-responsive-img" alt="">
                  </div>
              </div>
            </div>
  </div>
</div>


<br>
<h2>Couches technologiques utilisées</h2>

<h2>Autres références</h2>

<ul>
  <li></li>
  <li></li>
</ul>


<style>
.avatar {
  border-radius: 30%;
}
</style>
