document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.height = 500;
    canvas.width = 500;

    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'rgb(0,102,204)';
    ctx.fillRect(0, 100, 500, 350);

    ctx.beginPath();
    ctx.arc(250, 250, 50, 0, Math.PI, false);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 3;
    ctx.stroke();
    ctx.fillStyle = "purple";
    ctx.fill();
});
