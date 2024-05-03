$("#paivamaara-valikko").change(function(){
    let viikko = $("#paivamaara-valikko option:selected").val();
    $.getJSON("saa.php", {viikko: viikko}, function(data){
        $("#saa-laatikko").html(data);
        for(let paiva of data){
            $("#saa-laatikko").append(`
            <div class="saa">
                <p class="paivamaara">${paiva.paiva}</p>
                <p class="lampotila">${paiva.lampotila} &deg;C</p> 
                <p class="saa-otsikko">Säätila:</p>
                <p class="tieto">${paiva.saatila}</p>
                <p class="saa-otsikko">Tuulennopeus:</p>
                <p class="tieto">${paiva.tuulennopeus} m/s</p>
            </div>
            `);
            
        }
     });
})
