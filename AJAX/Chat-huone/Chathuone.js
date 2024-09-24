var uusinId = 0;

haePostaukset();

function haePostaukset(){
    $.getJSON("Viestinhaku.php?id=" + uusinId, function(postaukset) {   // blogi (vapaavalintainen muuttujanimi) sisältää JSON-olion
        for(let postaus of postaukset) {
            $("#postaukset").append(`<div class="postaus">
           <div id="postauksen_tiedot"><p>${postaus.nimimerkki} 
           ${postaus.aika}</p></div>
           <div id="viesti"><p>${postaus.postaus}</p></div>
           </div>`);
           uusinId = postaus.id;
        }
    });
}

setInterval(haePostaukset, 30000);

$("#napukka").click(function(){
    $.post("TallennaViesti.php", {nimimerkki: $("#nimimerkki").val(), postaus: $("#teksti").val()}, function(data){
        $("#nimimerkki").val("");
        $("#teksti").val("");
        haePostaukset();
     });

});
