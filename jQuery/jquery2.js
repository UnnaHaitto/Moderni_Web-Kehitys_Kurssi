$("#teht1 li").click(function(e){
    e.stopPropagation(); // Pysäyttää kuplimisen ekaan li:hin
    $(this).children().toggle(); // Piilota jos on näkyvissä/laita näkyviin jos on piilossa, ottaa vain lapsi elementit
})

$("#valikko1").change(function(){
    if($(this).val() == "auto"){
        console.log("auto")
        $("#valikko2").html("<option>henkilöauto</option><option>pakettiauto</option><option>kuorma-auto</option>");
    }
    else if($(this).val() == "vene"){
        $("#valikko2").html("<option>soutuvene</option><option>purjevene</option><option>moottorivene</option>");
    }
    else if($(this).val() == "lento"){
        $("#valikko2").html("<option>lentokone</option><option>suihkukone</option><option>kuumailmapallo</option><option>riippuliidin</option>")
    }
    else{
        $("#valikko2").html("<option></option>")
    }
})

$("#uusi").click(function(){
    $("#kentat").append(`<div class="kentta">
    <input type="text"><button class="poista">Poista</button>
    </div>`);
})

$("#kentat").on("click", ".poista", function(){ // Classien eteen tulee. Ja tämä pitää tehdä tuolleen että merkkaa click ja poista ym. erikseen, koska se elementti jota katsotaan tulee olla tehtynä jo kun sivusto luodaan ja kaikkia näitä uusia poista elementtejä ei ole. Tämän value on siis edelleen vain se poista nappi
    $(this).parent().remove(); // Tässä haetaan nappi ja sen vanhemman eli kentta divin
}) 

$(window).on("load resize", function(){
    // funktion toiminta tänne
    let Fonttikoko = $("#teht4").width() / 13; // Ottaa koko laatikon koon ja jakaa sen 13, koska ei haluta ihan laatikon kokoista tekstiä
    $("#teht4").css("font-size", Fonttikoko + "px") // Laittaa vastauksen pikseleiksi kun laittaa + "px"
})

$("#teht5 input").focus(function(){
    $(this).parent().children(".ohje").show();
})

$("#teht5 input").blur(function(){
    $(this).parent().children(".ohje").hide();
})

$("#teht6 div").click(function(e){ // Kupliminen stopataan nimeämällä tapahtuma ja laittamalla e.stopPropagation()
    e.stopPropagation();
    let Vari = $("#vari").val();
    $(this).css("background-color", Vari);
})

$("#max-50").keydown(function(){
    let Jaljella = 50 - $(this).val().length;

    $("#jaljella").html(Jaljella);
})

let laskuri; // Scopin takia

$("#kaynnistalaskuri").click(function(){
    laskuri = setInterval(function() { // Aloittaa laskemisen
        let Aika = parseInt($("#laskuri").val()) + 1; // Ottaa laskurin ajan ja lisää siihen yhden, sekunnin väliin
        $("#laskuri").val(Aika);
    
    }, 1000)
})

$("#pysaytalaskuri").click(function(){
    clearInterval(laskuri); // Pysäyttää laskurin (Purkaa set intervallin)
})
