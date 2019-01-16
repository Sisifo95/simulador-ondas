var xx, yy, colorsito2, colorsito1, colorsito3, colorsito4;

// clase ventana
class ventana {

    constructor() {

//valores reales
        this.rx1 = -3;
        this.rx2 = 5;
        this.ry1 = -20;
        this.ry2 = 20;
        //varoles en pixeles
        this.px1 = 0;
        this.py1 = 0;
        this.px2 = w;
        this.py2 = h;
        //valores pantalla
        this.px = 0;
        this.py = 0;
        this.xr = 0;
        this.yr = 0;
        this.zr = 0;
        //variables axonometria     
        this.ro = 0.5;
        this.alfa = Math.PI / 4;
        this.ax = 0;
        this.ay = 0;
    }

// Recive Reales y transforma a pixeles
    procesoPantalla(x, y) {
        this.px = ((x - this.rx2) * ((this.px2 - this.px1) / (this.rx2 - this.rx1))) + this.px2;
        this.py = ((y - this.ry2) * ((this.py1 - this.py2) / (this.ry2 - this.ry1))) + this.py1;
    }

// Recive Pixeles y transforma a reales
    procesoCarta(x, y) {

        this.xr = (x - this.px2) * ((this.rx2 - this.rx1) / (this.px2 - this.px1)) + this.rx2;
        this.yr = (y - this.py1) * ((this.ry2 - this.ry1) / (this.py1 - this.py2)) + this.ry2;
    }

//transforma 2D a 3D
    procesoAxonometria(x, y, z) {

        this.ax = y - (x * this.ro * Math.cos(this.alfa));
        this.ay = z - (x * this.ro * Math.sin(this.alfa));
    }

}

//clase vector
class vector extends ventana {

    constructor() {
        super();
        this.x = 0;
        this.y = 0;
    }

    get getX() {
        return this.x;
    }

    get getY() {
        return this.y;
    }

    set setX(x0) {
        this.x = x0;
    }

    set setY(y0) {
        this.y = y0;
    }

    encenderVector() {

        super.procesoPantalla(this.x, this.y);
        canvas.fillRect(this.px, this.py, 1, 1);
    }
}

//clase segmento
class segmento extends vector {
    constructor() {
        super();
    }

    encenderSegmento(x0, y0, xf, yf) {
        var t = 0, dt = 0.01;
        var v2 = new vector();
        do {
            v2.setX = x0 * (1 - t) + xf * t;
            v2.setY = y0 * (1 - t) + yf * t;
            v2.encenderVector();
            t += dt;
        } while (t <= 1);
    }
}

//clase vector 3D
class vector3D extends vector {

    constructor() {
        super();
        this.z = 0;
        this.teta = 0;
    }

    get getZ() {
        return this.z;
    }

    get getTeta() {
        return this.teta;
    }

    set setTeta(teta0) {
        this.teta = teta0;
    }

    set setZ(z0) {
        this.z = z0;
    }

    encenderVector3D() {
        super.procesoAxonometria(this.x, this.y, this.z);
        super.procesoPantalla(this.ax, this.ay);
        canvas.fillRect(this.px, this.py, 1, 1);
    }
}

//clase cuadrilatero
class cuadrilatero extends vector {

    constructor() {
        super();
        this.sx = 0;
        this.sy = 0;
        this.qx = 0;
        this.qy = 0;
        this.rx = 0;
        this.ry = 0;
        this.tx = 0;
        this.ty = 0;
        this.color1;
        this.color2;
    }

    get getSx() {
        return this.sx;
    }

    set setSx(sx) {
        this.sx = sx;
    }

    get getSy() {
        return this.sy;
    }

    set setSy(sy) {
        this.sy = sy;
    }

    get getQx() {
        return this.qx;
    }

    set setQx(qx) {
        this.qx = qx;
    }

    get getQy() {
        return this.qy;
    }

    set setQy(qy) {
        this.qy = qy;
    }

    get getRx() {
        return this.rx;
    }

    set setRx(rx) {
        this.rx = rx;
    }

    get getRy() {
        return this.ry;
    }

    set setRy(ry) {
        this.ry = ry;
    }

    get getTx() {
        return this.tx;
    }

    set setTx(tx) {
        this.tx = tx;
    }

    get getTy() {
        return this.ty;
    }

    set setTy(ty) {
        this.ty = ty;
    }

    get getColor1() {
        return this.color1;
    }

    set setColor1(color1) {
        this.color1 = color1;
    }

    get getColor2() {
        return this.color2;
    }

    set setColor2(color2) {
        this.color2 = color2;
    }

    encenderCuadrilatero() {
        var SPx1, SPy1, SQx, SQy, SRx, SRy, STx, STy;
        super.procesoPantalla(this.sx, this.sy);
        SPx1 = this.px;
        SPy1 = this.py;
        super.procesoPantalla(this.qx, this.qy);
        SQx = this.px;
        SQy = this.py;
        super.procesoPantalla(this.rx, this.ry);
        SRx = this.px;
        SRy = this.py;
        super.procesoPantalla(this.tx, this.ty);
        STx = this.px;
        STy = this.py;

        canvas.fillStyle = this.color2;
        canvas.strokeStyle = this.color1;
        canvas.beginPath();
        canvas.lineTo(SPx1, SPy1);
        canvas.lineTo(SQx, SQy);
        canvas.lineTo(SRx, SRy);
        canvas.lineTo(STx, STy);
        canvas.closePath();
        canvas.fill();
        canvas.stroke();

    }
}

//función para crear array bidimensional
function Create2DArray(rows) {
    var arr = [];
    for (var i = 0; i < rows; i++) {
        arr[i] = [];
    }

    return arr;
}

//clase ondas alambert 2D
class alambert2D extends vector {

    constructor() {
        super();
    }

    encenderOnda2D(t) {

        var v1 = new vector();
        var s1 = new segmento();

        var x = -2;
        var dx = 0.1;
        var v3 = 0, v4 = 0;
        do
        {

            v1.setX = x;
            v1.setY = metodoAlambert2D(t, x);
            x += dx;
            v3 = x;
            v4 = metodoAlambert2D(t, x);
            canvas.fillStyle = "black";
            s1.encenderSegmento(v1.getX, v1.getY, v3, v4);

        } while (x <= 4);
    }

}

//clase ondas fourier 3D
class fourier3D extends vector3D {

    constructor() {
        super();
    }

    encenderSuperficie(t) {

        var i, j, ni, nj;
        var mx = Create2DArray(100);
        var my = Create2DArray(100);
        var v3d = new vector3D();
        var w3d = new vector3D();
        var x = 0;
        var dx = 0.04;
        i = 0;
        do {
            var y = 0;
            var dy = 0.04;
            j = 0;
            do {
                v3d.setX = 2 * x;
                v3d.setY = 2 * y;
                v3d.setZ = 2 * metodoFourier3D(x, y, t);

                super.procesoAxonometria(v3d.getX, v3d.getY, v3d.getZ);
                mx[i][j] = this.ax;
                my[i][j] = this.ay;
                y += dy;
                j += 1;
                y += dy;
            } while (y <= 1);
            x += dx;
            i += 1;
        } while (x <= 1);
        ni = i;
        nj = j;
        this.procesoMallado(ni, nj, mx, my);
        mx = null;
        my = null;
    }

    procesoMallado(ni, nj, mx, my) {

        var cua = new cuadrilatero();

        colorsito2 = 'rgb(35,239,2)';
        colorsito1 = 'rgb(15,100,255)';
        colorsito3 = 'rgb(196,187,187)';
        colorsito4 = 'rgb(248,10,172)';

        for (var i = 0; i < ni - 1; i++) {
            for (var j = 0; j < nj - 1; j++) {
                cua.setSx = mx[i][j];
                cua.setSy = my[i][j];
                cua.setQx = mx[i + 1][j];
                cua.setQy = my[i + 1][j];
                cua.setRx = mx[i + 1][j + 1];
                cua.setRy = my[i + 1][j + 1];
                cua.setTx = mx[i][j + 1];
                cua.setTy = my[i][j + 1];

                xx = (mx[i + 1][j] - mx[i][j]) * (my[i + 1][j + 1] - my[i + 1][j]);
                yy = (mx[i + 1][j + 1] - mx[i + 1][j]) * (my[i + 1][j] - my[i][j]);

                if ((xx - yy) > 0) {
                    cua.setColor1 = colorsito4;
                    cua.setColor2 = colorsito3;
                } else {
                    cua.setColor1 = colorsito2;
                    cua.setColor2 = colorsito1;
                }
                cua.encenderCuadrilatero();
            }

        }
    }
}

//clase ondas fourier 2D
class fourier2D extends vector {

    constructor() {
        super();
    }

    encenderOnda2D(t) {

        var v1 = new vector();
        var s1 = new segmento();
        var x = 0;
        var dx = 0.1;
        var v3 = 0, v4 = 0;

        do
        {
            v1.setX = x;
            v1.setY = metodoFourier2D(x, t);
            x += dx;
            v3 = x;
            v4 = metodoFourier2D(x, t);
            canvas.fillStyle = "black";
            s1.encenderSegmento(v1.getX, v1.getY, v3, v4);
        } while (x <= 2);
    }

}

function metodoAlambert2D(t, x) {

    var coeficiente_elasticidad = $('#coeficiente').val();
    var funcPos = $('#posicionInput').val();
    var funcVel = $('#velocidadInput').val();

    var coe1 = x + (coeficiente_elasticidad * t);
    var coe2 = x - (coeficiente_elasticidad * t);

    var derecha = funcPos.replace(/x/g, coe1);
    var izquierda = funcPos.replace(/x/g, coe2);
    var pos = math.eval(derecha) + math.eval(izquierda);

    var deltaX = (coe1 - coe2) / 4;
    var x0, x1, x2, x3, x4, x5;
    x0 = coe2;
    x1 = x0 + deltaX;
    x2 = x1 + deltaX;
    x3 = x2 + deltaX;
    x4 = x3 + deltaX;
    x5 = deltaX / 3;
    var f0, f1, f2, f3, f4;

    f0 = funcVel.replace(/x/g, x0);
    f1 = funcVel.replace(/x/g, x1);
    f2 = funcVel.replace(/x/g, x2);
    f3 = funcVel.replace(/x/g, x3);
    f4 = funcVel.replace(/x/g, x4);

    var vel = 0.5 * coeficiente_elasticidad * (x5 * (math.eval(f0) + (4 * math.eval(f1)) + (2 * math.eval(f2)) + (4 * math.eval(f3)) + math.eval(f4)));
    var val = pos + vel;

    return val;
}

function metodoFourier2D(x, t) {

    var l = 2;
    var coeficiente_elasticidad = $('#coeficiente').val();
    var funcPos = $('#posicionInput').val();
    var funcVel = $('#velocidadInput').val();

    var an, bn, resultado = 0;

    var deltaX = (l - 0) / 4;
    var x0, x1, x2, x3, x4, x5;
    x0 = 0;
    x1 = x0 + deltaX;
    x2 = x1 + deltaX;
    x3 = x2 + deltaX;
    x4 = x3 + deltaX;
    x5 = (l - 0) / 12;

    var f0, f1, f2, f3, f4, f5, f6;
    var g0, g1, g2, g3, g4;

    f0 = funcPos.replace(/x/g, x0);
    f1 = funcPos.replace(/x/g, x1);
    f2 = funcPos.replace(/x/g, x2);
    f3 = funcPos.replace(/x/g, x3);
    f4 = funcPos.replace(/x/g, x4);

    g0 = funcVel.replace(/x/g, x0);
    g1 = funcVel.replace(/x/g, x1);
    g2 = funcVel.replace(/x/g, x2);
    g3 = funcVel.replace(/x/g, x3);
    g4 = funcVel.replace(/x/g, x4);

    for (var n = 1; n < 4; n++) {

        f5 = Math.sin((n * Math.PI * x) / l);
        f6 = (n * Math.PI * coeficiente_elasticidad * t) / l;

        an = (2 / l) * (x5 * ((math.eval(f0) * f5) + (4 * math.eval(f1) * f5) + (2 * math.eval(f2) * f5) + (4 * math.eval(f3) * f5) + (math.eval(f4) * f5)));
        bn = (2 / (n * Math.PI * coeficiente_elasticidad)) * (x5 * ((math.eval(g0) * f5) + (4 * math.eval(g1) * f5) + (2 * math.eval(g2) * f5) + (4 * math.eval(g3) * f5) + (math.eval(g4) * f5)));

        resultado += f5 * ((an * Math.cos(f6)) + (bn * Math.sin(f6)));

    }

    return resultado;
}

function metodoFourier3D(x, y, t) {

    var coeficiente_elasticidad = $('#coeficiente').val();
    var funcPos = $('#posicionInput').val();
    var funcVel = $('#velocidadInput').val();
    var nodo_onda = $('#nodo').val();
    var n, m;
    switch (nodo_onda) {
        case '0':
            n = 1;
            m = 1;
            break;
        case '1':
            n = 1;
            m = 2;
            break;
        case '2':
            n = 2;
            m = 1;
            break;
        case '3':
            n = 2;
            m = 2;
            break;
        case '4':
            n = 1;
            m = 3;
            break;
        case '5':
            n = 3;
            m = 1;
            break;
        case '6':
            n = 3;
            m = 2;
            break;
    }
    var a, b, c, d, l1, l2, wnm, anm, g, bnm, result = 0;
    l1 = 1;
    l2 = 1;
    c = (n * Math.PI * x) / l1;
    d = (m * Math.PI * y) / l2;
    g = ((n * n) / (l1 + l1)) + ((m * m) / (l2 * l2));
    wnm = coeficiente_elasticidad * Math.PI * Math.sqrt(g);
    anm = (4 / (l1 * l2)) * simpsonDoble(funcPos, 0, l1, 0, l2, 2, 2);
    bnm = (4 / (l1 * l2 * wnm)) * simpsonDoble(funcVel, 0, l1, 0, l2, 2, 2);
    a = anm * Math.cos(wnm * t);
    b = bnm * Math.sin(wnm * t);
    result = (a + b) * Math.sin(c) * Math.sin(d);

    return result;
}

function  simpsonDoble(funcion, a, b, c, d, m, n) {

    var h = (b - a) / (2 * n);
    var J1 = 0.0, J2 = 0.0, J3 = 0.0;
    var x, y, f1, f2, f3;
    var HX, K1, K2, K3, Q, L;
    for (var i = 0; i <= 2 * n; i++) {
        x = a + (i * h);
        HX = (d - c) / (2 * m);
        f1 = funcion.replace(/x/g, x);
        f1 = f1.replace(/y/g, c);
        f2 = funcion.replace(/x/g, x);
        f2 = f2.replace(/y/g, d);
        K1 = math.eval(f1) + math.eval(f2);
        K2 = 0.0;
        K3 = 0.0;
        for (var j = 1; j <= 2 * m - 1; j++) {
            y = c + (j * HX);
            f3 = funcion.replace(/x/g, x);
            f3 = f3.replace(/y/g, y);
            Q = math.eval(f3);
            if (j % 2 == 0)
                K2 += Q;
            else
                K3 += Q;
        }
        L = ((K1 + (2 * K2) + (4 * K3)) * HX) / 3;
        if (i == 0 || i == 2 * n)
            J1 += L;
        else {
            if (i % 2 == 0)
                J2 += L;
            else
                J3 += L;
        }
    }
    var J = (h * (J1 + (2 * J2) + (4 * J3))) / 3;
    return J;
}
 