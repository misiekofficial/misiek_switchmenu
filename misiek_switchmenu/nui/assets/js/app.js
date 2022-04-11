function sendEvent(name, data = {}) {
    if(window.invokeNative) {
        // we cant use GetParentResourceName here :(
        fetch(`https://misiek_switchmenu/${name}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(data)
        })

        refreshTooltips()
    } else {
        console.log(data)
    }
}

function ExecuteCommand(event, param) {
    sendEvent("executeCommand", {
        event: event,
        param: param
    })
}

$(document).ready(() => {
	Vue.use(Toasted, {
        iconPack: 'fontawesome'
    })

	const app = new Vue({
		el: "#app",

		data: {
			show: false,
		},
	})

	window.addEventListener('message', function(event) {
		var data = event.data;

		if (data.show) {
			$("#app").fadeIn(200)
            refreshTooltips()
		} else {
			$("#app").fadeOut(200)
            refreshTooltips()
		}
	});

    sendEvent("ready")
})