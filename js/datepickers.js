$(document).ready(function () {

    $("txtDOB").datepicker().datepicker("setDate", new Date());
    $('#txtDOB').datepicker({
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true,
        minDate: new Date(1900, 0, 1),
        maxDate: new Date(),
        yearRange: "1900:" + (new Date).getFullYear()
    });

   /* $("BodyHolder_txtDOBUpdate").datepicker().datepicker("setDate", new Date());
    $('#BodyHolder_txtDOBUpdate').datepicker({
        dateFormat: 'dd/mm/yy',
        changeMonth: true,
        changeYear: true,
        minDate: new Date(1900, 0, 1),
        maxDate: new Date(),
        yearRange: "1900:" + (new Date).getFullYear()
    });*/
    
    
});

function alrt() {
    alert('hello');
    alert(document.getElementById('#BodyHolder_txtDOB').innerText);
}