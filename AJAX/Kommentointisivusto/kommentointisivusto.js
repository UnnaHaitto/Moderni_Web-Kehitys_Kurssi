
$.getJSON("haeAsiakirja.php", function(asiakirja) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion7
    for(var i=0; i < asiakirja.length; i++) {
       $("#asiakirjavalinta").append('<option value="' + asiakirja[i].asiakirja_id + '">' + asiakirja[i].otsikko + '</option>');
    }

    $("#asiakirjavalinta").change(function(){
        $.getJSON("haeAsiakirja.php", {id: $(this).val()}, function(asiakirja) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion
            $("main article").html("");
            for(var i=0; i < asiakirja.length; i++) {
               $("main article").append(`
                    <h2>${asiakirja[i].otsikko}</h2>
                    <p class="kirjoittajainfo"><b>Kirjoittanut: </b>${asiakirja[i].kirjoittaja} (${asiakirja[i].pvm})</p>
                    <p>${asiakirja[i].teksti.replace(/\n/g, "</p><p>")}</p> 
                `);
            }
        });

        $("#kommentit").css("display", "block");

        $.getJSON("haeKommentit.php", {id: $(this).val()}, function(kommentit) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion
            $("#kommentit").html('');
            for(var i=0; i < kommentit.length; i++) {
               $("#kommentit").append(`
                <div class="kommentti">
                <p class="kommentoijainfo">${kommentit[i].kommentoija} ${kommentit[i].pvm}</p>
                <h2>${kommentit[i].otsikko}</h2>
                <div class="kommenttisisalto">
                    <p>${kommentit[i].teksti}</p>
                </div>
                </div>
            `);
            }

            $("#kommentit").append(`<div id="lisaa-kommentti">
				<h2>Lisää oma kommenttisi</h2>
				<p><span class="kommentti-label">Nimi tai nimimerkki:</span> <input type="text" id="kommenttinimimerkki" size="30"></p>
				<p><span class="kommentti-label">Kommenttiotsikko:</span> <input type="text" id="kommenttiotsikko" size="30"></p>
				<p><textarea id="kommenttiteksti" cols="60" rows="10"></textarea></p>
                <input type="hidden" id="asiakirjaid" value="${$("#asiakirjavalinta").val()}">
				<p><button id="laheta-kommentti">Lähetä</button>
			</div>`)
        });
    });
});
$("#kommentit").on("click", "#laheta-kommentti", function(){
    $.post("tallennaKommentti.php", {
        otsikko: $("#kommenttiotsikko").val(),
        teksti: $("#kommenttiteksti").val(),
        kommentoija: $("#kommenttinimimerkki").val(),
        asiakirja_id: $("#asiakirjaid").val(),
    }, 
    function(data){
        $.getJSON("haeKommentit.php", {id: $("#asiakirjavalinta").val()}, function(kommentit) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion
            $("#kommentit").html('');
            for(var i=0; i < kommentit.length; i++) {
               $("#kommentit").append(`
                <div class="kommentti">
                <p class="kommentoijainfo">${kommentit[i].kommentoija} ${kommentit[i].pvm}</p>
                <h2>${kommentit[i].otsikko}</h2>
                <div class="kommenttisisalto">
                    <p>${kommentit[i].teksti}</p>
                </div>
                </div>
            `);
            }

            $("#kommentit").append(`<div id="lisaa-kommentti">
				<h2>Lisää oma kommenttisi</h2>
				<p><span class="kommentti-label">Nimi tai nimimerkki:</span> <input type="text" id="kommenttinimimerkki" size="30"></p>
				<p><span class="kommentti-label">Kommenttiotsikko:</span> <input type="text" id="kommenttiotsikko" size="30"></p>
				<p><textarea id="kommenttiteksti" cols="60" rows="10"></textarea></p>
                <input type="hidden" id="asiakirjaid" value="${$("#asiakirjavalinta").val()}">
				<p><button id="laheta-kommentti">Lähetä</button>
			</div>`)
        }); 
     }); 
})

$.getJSON("haeAsiakirja.php", function(asiakirja) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion
    $("main article").html("");
    for(var i=0; i < asiakirja.length; i++) {
       $("main article").append(`
            <h2>${asiakirja[i].otsikko}</h2>
            <p class="kirjoittajainfo"><b>Kirjoittanut: </b>${asiakirja[i].kirjoittaja} (${asiakirja[i].pvm})</p>
            <p>${asiakirja[i].teksti.replace(/\n/g, "</p><p>")}</p> 
        `);
    }
});

$("#kommentit").css("display", "none");