$("#sivupalkki h3").click(function(){
    if($(this).parent().hasClass("auki")){
        $(this).parent().removeClass("auki");
        $(this).parent().addClass("kiinni");
    }
    else{
        $(this).parent().removeClass("kiinni");
        $(this).parent().addClass("auki");
    }
    
})

let Nykyinen = 0;

$("#sisalto li").click(function(){
    Nykyinen = $(this).attr("data-tab");
    $("#sisalto li").removeClass("valittu");
    $(this).addClass("valittu");
    $("#tab1, #tab2, #tab3").removeClass("valittu");
    $("#tab" + Nykyinen).addClass("valittu");
})

$("#rekisteroityminen").submit(function(e){
    e.preventDefault(); // Ei lähetä lomaketta (tiedot pysyy)
    if($("#nimimerkkikentta").val() == ""){
        $("#nimimerkkikentta").parent().children(".rlabel").css("color", "pink"); // Parent on <p></p>
    }
    else{
        $("#nimimerkkikentta").parent().children(".rlabel").css("color", "black");
    }

    if($("#sahkopostikentta").val() == ""){
        $("#sahkopostikentta").parent().children(".rlabel").css("color", "pink");
    }
    else{
        $("#sahkopostikentta").parent().children(".rlabel").css("color", "black");
    }

    if($("#salasanakentta1").val() == ""){
        $("#salasanakentta1").parent().children(".rlabel").css("color", "pink");
    }
    else{
        $("#salasanakentta1").parent().children(".rlabel").css("color", "black");
    }

    if($("#salasanakentta2").val() == ""){
        $("#salasanakentta2").parent().children(".rlabel").css("color", "pink");
    }
    else{
        $("#salasanakentta2").parent().children(".rlabel").css("color", "black");
    }
})

$("#salasanakentta1").focus(function(){
    $(".ohje").css("display", "inline-block");
})

$("#salasanakentta1").blur(function(){
    $(".ohje").css("display", "none");
})

$("#salasanakentta1").on("input", function(){
    if($(this).val().length < 8){
        $(this).css("background-color", "pink");
    }
    else{
        $(this).css("background-color", "green");
    }

    if($(this).val() == $("#salasanakentta2").val()){
        $("#salasanakentta2").css("background-color", "green")
    }
    else{
        $("#salasanakentta2").css("background-color", "pink")
    }
})

$("#salasanakentta2").on("input", function(){
    if($(this).val() == $("#salasanakentta1").val()){
        $(this).css("background-color", "green")
    }
    else{
        $(this).css("background-color", "pink")
    }
})

$("#hyvaksykayttoehdot").click(function(){
    if($(this).prop("checked")){
        $("#rekisteroityminen input[type=submit]").prop("disabled", false);  // Haetaan rekisteroityminen osasta submit tyyppi ja laitetaan se lähettäminen päälle
    }
    else{
        $("#rekisteroityminen input[type=submit]").prop("disabled", true); 
    }
})

$("#tab2 td").dblclick(function(){
    $("#tab2 td").attr("contenteditable", false);
    $(this).attr("contenteditable", true);
})

$("#tab2 td").keydown(function(e){
    if(e.key == "Enter"){ // Haetaan enten nappi ja poistetaan rivin muokkaaminen
        $("#tab2 td").attr("contenteditable", false);
    }
})

$("#lisaarivi").click(function(){
$("#laskentataulukko tr:last-child").clone().appendTo("#laskentataulukko"); // Ottaa tablen viimeisen rivin ja copy pasteaa sen taulukon viimeiseksi lapseksi
})

$("#laskentataulukko").on("click", ".poisto button", function(){
    $(this).parent().parent().remove();
})

const Kortit = ["tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "tyhjakortti", "aurinko", "sydan", "sydanrikki"]

let Yritykset = 3;

$("#aloita").click(function(){
    Kortit.sort(function(a, b){return 0.5 - Math.random()}); // Tuloksena luvut satunnaisesti
    Yritykset = 3; // Koska ei haluta että saat kolme yritystä niin kauan kuin olet sivulla vaan kolme yritystä niin kauan kuin haluat yrittää uudelleen
    $("#viesti").html(`Yrityksiä jäljellä ${Yritykset}!`);

    $("#kortit img").attr("src", "kortti.png"); // kortti.png on tyhjä kortti (näkyy html puolella)

    $("#kortit img").on("click", function(){ 
        $(this).off("click"); // Klick pois
        let Indeksi = $(this).attr("data-indeksi") - 1; // -1 koska taulukot aloittaa nollasta 

        $(this).attr("src", Kortit[Indeksi] + ".png") // Laittaa atribuutin jonka nimi näkyy Kortit taulukossa ja sen perään lisätään .png koska taulukossa sellaista ei vielä ole

        if(Kortit[Indeksi] == "sydan"){
            $("#kortit img").off("click"); 
            $("#viesti").html("voi!");
        }

        if(Kortit[Indeksi] == "sydanrikki"){
            $("#kortit img").off("click"); 
            $("#viesti").html("HÄVISIT >:)");
        }

        if(Kortit[Indeksi] == "tyhjakortti"){
            Yritykset -= 1;
            $("#viesti").html(`Yrityksiä jäljellä ${Yritykset}!`);
        }

        if(Kortit[Indeksi] == "aurinko"){
            Yritykset += 1;
            $("#viesti").html(`Yrityksiä jäljellä ${Yritykset}!`);
        }

        if(Yritykset <= 0){
            $("#kortit img").off("click"); 
            $("#viesti").html("HÄVISIT >:)");
        }
    })
})

