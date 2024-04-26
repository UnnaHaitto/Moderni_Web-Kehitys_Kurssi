let Ajastin;
let Nykyinen = 1;

KaynnistaAjastin();

$("#alapalkki span").click(function(){ // Pitää katsoa alapalkin Spanit, jotta saadaan selville mitä nappia klikattiin
    Nykyinen = parseInt($(this).attr("data-index")) // Hakee mikä data index html puolella on (se uusi ns. muuttuja mikä sinne tehtiin) (toisin sanoen menee siihen mitä klikattiin)
    $(".kuva").removeClass("valittu"); //poistetaan classi
    $("#kuva-" + Nykyinen).addClass("valittu");
    $("#alapalkki span").removeClass("valittu"); // Poistetaan class
    $("#navi-" + Nykyinen).addClass("valittu"); // Lisätään class

    clearInterval(Ajastin); // Ajastin pysäytetään ettei taustalle jää toista ajastinta
    
    KaynnistaAjastin();
})

function KaynnistaAjastin(){
    Ajastin = setInterval(function(){
        Nykyinen+= 1;

        if(Nykyinen > 5){
            Nykyinen = 1;
        }

        $(".kuva").removeClass("valittu"); //poistetaan classi
        $("#kuva-" + Nykyinen).addClass("valittu");
        $("#alapalkki span").removeClass("valittu"); // Poistetaan class
        $("#navi-" + Nykyinen).addClass("valittu"); // Lisätään class
    }, 5000)
}
