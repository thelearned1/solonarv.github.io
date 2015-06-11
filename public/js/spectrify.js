// Literally the only non-functional code in this file. Yay!
function doIt(){
    var input = document.getElementById("spectrify-input"),
        output = document.getElementById("spectrify-result");
    output.textContent = spectrify(input.value);
}

function spectrify(txt){
    var words = txt.split(" "),
        reversed = reverse(txt),
        reversedWords = words.map(reverse).join(" ");
    return interleaveS(txt, reversed, reversedWords);
}

function reverse(s){
    return s.split("").reverse().join("");
}

function interleaveS(){
    var strs = Array.prototype.slice.call(arguments);
    return flatten(strs[0].split("").map(function (_, ix){
        return strs.map(function (s){ return s[ix]; });
    })).join("")
}

function flatten(arrs){ // [[a]] -> [a]
    return [].concat.apply([], arrs);
}
