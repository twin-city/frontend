<svelte:head>
	<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</svelte:head>

<script>
import { onMount, onDestroy, setContext } from 'svelte'

export let buildUrl;
export let width;
export let height;

let unityInstance=undefined ;

function onQuit() {
	alert('Quit the game')
}


onDestroy(() => {
	console.log('onDestroy')
	if (unityInstance != undefined){
			unityInstance.Quit().then(onQuit)
	}
})

onMount(() => {
	var container = document.querySelector("#unity-container");
	var canvas = document.querySelector("#unity-canvas");
	var loadingBar = document.querySelector("#unity-loading-bar");
	var progressBarFull = document.querySelector("#unity-progress-bar-full");
	var fullscreenButton = document.querySelector("#unity-fullscreen-button");
	var warningBanner = document.querySelector("#unity-warning");

	// Shows a temporary message banner/ribbon for a few seconds, or
	// a permanent error message on top of the canvas if type=='error'.
	// If type=='warning', a yellow highlight color is used.
	// Modify or remove this function to customize the visually presented
	// way that non-critical warnings and error messages are presented to the
	// user.
	function unityShowBanner(msg, type) {
		function updateBannerVisibility() {
			warningBanner.style.display = warningBanner.children.length ? 'block' : 'none';
		}
		var div = document.createElement('div');
		div.innerHTML = msg;
		warningBanner.appendChild(div);
		if (type == 'error') div.style = 'background: red; padding: 10px;';
		else {
			if (type == 'warning') div.style = 'background: yellow; padding: 10px;';
			setTimeout(function() {
				warningBanner.removeChild(div);
				updateBannerVisibility();
			}, 5000);
		}
		updateBannerVisibility();
	}


	var loaderUrl = buildUrl + "/BuildWeb.loader.js";
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
		console.log('else')
		container.style.height = height;
		container.style.width = width;

		canvas.style.width = width;
		canvas.style.height = "calc(" + height + " - 5rem)";
		container.style.display = 'block'
	}
	loadingBar.style.display = "block";
	var script = document.createElement("script");
	script.src = loaderUrl;
	script.onload = async () => {
		console.log('script.onload')
		try {
			unityInstance = await createUnityInstance(canvas, config, (progress) => {
				progressBarFull.style.width = 100 * progress + "%";
				console.log(progress)
			})
			await (async (unityInstance) => {
				loadingBar.style.display = "none";
				fullscreenButton.onclick = () => {
					unityInstance.SetFullscreen(1);
				};
			})
		} catch(message) {
			alert(message);
		}
	};
	document.body.appendChild(script);
});

</script>

<div id="unity-container" class="unity-desktop">
	<canvas id="unity-canvas" width=800	 height=600></canvas>
	<div id="unity-loading-bar">
		<div id="unity-logo"></div>
		<div id="unity-progress-bar-empty">
			<div id="unity-progress-bar-full"></div>
		</div>
	</div>
	<div id="unity-warning"> </div>
	<div id="unity-footer">
		<div id="unity-webgl-logo"></div>
		<div id="unity-fullscreen-button"></div>
	</div>
</div>

<style>
#unity-container { background: #231F20;display: none; }
#unity-canvas { background: #231F20 }
#unity-loading-bar {
	display: none;
	margin-left: 5px;
}
#unity-progress-bar-empty { width: 141px; height: 18px; margin-top: 10px; background: url('webgl/progress-bar-empty-dark.png') no-repeat center }
#unity-progress-bar-full { width: 0%; height: 18px; margin-top: 10px; background: url('webgl/progress-bar-full-dark.png') no-repeat center }
#unity-webgl-logo { float:left; width: 204px; height: 38px; background: url('webgl/webgl-logo.png') no-repeat center }
#unity-build-title { float: right; margin-right: 10px; line-height: 38px; font-family: arial; font-size: 18px }
#unity-fullscreen-button { float: right; width: 38px; height: 38px; background: url('webgl/fullscreen-button.png') no-repeat center }
#unity-warning { position: absolute; left: 50%; top: 5%; transform: translate(-50%); background: white; padding: 10px; display: none }
</style>
