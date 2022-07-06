<svelte:head>
	<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <script src="/webgl/Build/BuildWeb.loader.js" on:load={scriptOnload}></script>
	</svelte:head>

<script>
import { onMount, setContext } from 'svelte'

let canvas;

let loadingBarDisplay = "none"
let warningBannerVisibility = false
let warningBannerMsg = ''
let progressBarFullWidth;


let  handleClick = () => {};

var buildUrl = "/webgl/Build";
var loaderUrl = buildUrl + "/BuildWeb.loader.js";

// Shows a temporary message banner/ribbon for a few seconds, or
// a permanent error message on top of the canvas if type=='error'.
// If type=='warning', a yellow highlight color is used.
// Modify or remove this function to customize the visually presented
// way that non-critical warnings and error messages are presented to the
// user.
function unityShowBanner(msg, type) {


	warningBannerVisibility = true
	warningBannerMsg = msg;
	if (type == 'error') {
			console.log('error')
	} else {
		if (type == 'warning') {
			console.log('warning')
			setTimeout(function() {
				warningBannerVisibility = false
			}, 5000);
		};
	}
	updateBannerVisibility();

}

var config = {
	dataUrl: buildUrl + "/BuildWeb.data.gz",
	frameworkUrl: buildUrl + "/BuildWeb.framework.js.gz",
	codeUrl: buildUrl + "/BuildWeb.wasm.gz",
	streamingAssetsUrl: "StreamingAssets",
	companyName: "DefaultCompany",
	productName: "TwincityURP",
	productVersion: "0.1",
	showBanner: unityShowBanner,
};

function scriptOnload() {
	console.log('BuildWeb.loader.js is loaded!')
	createUnityInstance(canvas, config, (progress) => {
		progressBarFullWidth = 100 * progress + "%";
	}).then((unityInstance) => {
		loadingBarDisplay = "none";
		handleClick = () => {
			unityInstance.SetFullscreen(1);
		};

	}).catch((message) => {
		alert(message);
	});
};


onMount(() => {
	var fullscreenButton = document.querySelector("#unity-fullscreen-button");
	var warningBanner = document.querySelector("#unity-warning");


	// By default Unity keeps WebGL canvas render target size matched with
	// the DOM size of the canvas element (scaled by window.devicePixelRatio)
	// Set this to false if you want to decouple this synchronization from
	// happening inside the engine, and you would instead like to size up
	// the canvas DOM size and WebGL render target sizes yourself.
	// config.matchWebGLToCanvasSize = false;

	if (/iPhone|iPad|iPod|Android/i.test(navigator.userAgent)) {
	  container.className = "unity-mobile";
	  // Avoid draining fillrate performance on mobile devices,
	  // and default/override low DPI mode on mobile browsers.
	  config.devicePixelRatio = 1;
	  unityShowBanner('WebGL builds are not supported on mobile devices.');
	} else {
	  canvas.style.width = "960px";
	  canvas.style.height = "600px";
	}

	loadingBarDisplay = "block";

});

</script>

<div id="unity-container" class="unity-desktop">

			Tada !!!!
     <canvas bind:this={canvas} id="unity-canvas" width=960 height=600></canvas>
     <div id="unity-loading-bar" style="display: {loadingBarDisplay}">
       <div id="unity-logo"></div>
       <div id="unity-progress-bar-empty">
         <div id="unity-progress-bar-full" style="width: {progressBarFullWidth}"></div>
       </div>
     </div>
		 {#if warningBannerVisibility}
     		<div id="unity-warning"> warningBannerMsg </div>
		{/if}

     <div id="unity-footer">
       <div id="unity-webgl-logo"></div>
       <div on:click={handleClick} id="unity-fullscreen-button"></div>
       <div id="unity-build-title">TwincityURP</div>
     </div>
   </div>
