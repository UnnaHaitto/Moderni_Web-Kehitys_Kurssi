$("#teht1").click(function(){
    $("#teht1-1").slideUp(1000);
    $("#teht1-2").slideUp(1000);
    $("#teht1-3").slideUp(1000);
    $("#teht1-4").slideUp(1000);
    $("#teht1-1").slideDown(1000, function() {
        $("#teht1-2").slideDown(1000, function() {
            $("#teht1-3").slideDown(1000, function(){
                $("#teht1-4").slideDown(1000);
            });
        });
    });
})

let KlikkaustenMäärä = 0;
$("#teht3").click(function(){
    KlikkaustenMäärä ++;
    if(KlikkaustenMäärä == 1){
        $("#teht3").html("Kiitos!");
    }
    else if(KlikkaustenMäärä == 2){
        $("#teht3").html("Riittää jo!!");
    }
    else if(KlikkaustenMäärä == 3){
        $("#teht3").html("LOPETAA!!!");
    }
})

$("#teht4 select").change(function(){
    $("body").css("color", $("#teht4 select").val());
})

$("#teht5").click(function(){
    $("#teht4 select").off("change"); // Kytkee tapahtuman käsittelijän change pois päältä
})

$(document).keypress(function(e){
    console.log("tapahtuu");
    let Nappain = e.key;
    let UusiTeksti = $("#teht6").html() + Nappain;
    $("#teht6").html(UusiTeksti);  
})

$("#lisaa").click(function(){
    let Arvo = $("#uusi").val();
    $("#muistettavat").append(`<li>${Arvo}</li>`);
})

$("#vasen").click(function(){
    $("#pieni-nelio").animate({left: "-=10px"});
    $("#pieni-nelio").css("transform", "none");
})

$("#oikea").click(function(){
    $("#pieni-nelio").animate({left: "+=10px"});
    if($("#pieni-nelio").css("transform") == "none"){
        $("#pieni-nelio").css("transform", "rotateY(180deg)");
    }
})