var button = null;

function setup() {
	window.removeEventListener("load", this, false);
	
	button = document.querySelector("button#generate");
	button.addEventListener("click", generate, false);

	generate();
}

function generate() {
	var originalTitle = button.innerHTML;
	
	button.innerHTML = "Generating";
	button.classList.add("pulse");
	button.setAttribute("disabled", "disabled");

	var request = new XMLHttpRequest();

	request.onreadystatechange = function() {
		if (this.readyState == 4) {
			
			button.innerHTML = originalTitle;
			button.removeAttribute("disabled");
			button.classList.remove("pulse");

			if (this.status != 200) {
				alert("Sorry, the generator is dead. Code " + this.status);
				return false;
			}

			processResults(JSON.parse(this.responseText));
		}
	};

	request.open("GET", "/architecture", true);
	request.send();
}

function processResults(architecture) {
	var initialismContainer = document.querySelector("#initialism");
	var nameContainer = document.querySelector("#name");

	initialismContainer.innerHTML = architecture.initialism;
	nameContainer.innerHTML = architecture.name;
}

window.addEventListener("load", setup, false);