window.iqtest = {
    calculate: function(){
        let input = document.getElementById("iqtest-input")
        let output = document.getElementById("iqtest-output")

        var total = 0
        for(var i of input.elements) {
            if(i.checked) {
                total += +i.value
            }
        }

        output.innerHTML = "your IQ is " + total
    }
}