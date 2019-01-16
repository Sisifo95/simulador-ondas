/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//inicializar el canvas
var canvas = document.getElementById('reporteCanvas').getContext('2d');
var w = 850;
var h = 450;
var area = document.getElementById('reporteCanvas');
var ts = new fourier3D();
var t = 0, animacion = null;
//variables globales

function drawAlambert2D() {
    var onda = new alambert2D();
    canvas.clearRect(0, 0, w, h);
    onda.encenderOnda2D(t);
    t += 0.025;
    animacion = requestAnimationFrame(drawAlambert2D);
}

function drawFourier2D() {
    var onda = new fourier2D();
    canvas.clearRect(0, 0, w, h);
    onda.encenderOnda2D(t);
    t += 0.05;
    animacion = requestAnimationFrame(drawFourier2D);
}

function drawFourier3D() {
    var onda = new fourier3D();
    canvas.clearRect(0, 0, w, h);
    onda.encenderSuperficie(t);
    t += 0.05;
    animacion = requestAnimationFrame(drawFourier3D);   
}

function historicoDalambert2D() {
    t = 0;
    drawAlambert2D();
}

function historicoFourier2D() {
    t = 0;
    drawFourier2D();
}

function historicoFourier3D() {
    t = 0;
    drawFourier3D();
}

function cancel() {
    cancelAnimationFrame(animacion);
}
