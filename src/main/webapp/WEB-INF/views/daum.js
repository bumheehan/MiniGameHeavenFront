function setCa(a) {
    var b = daum.$$(".gnb_sub li");
    daum.addClassName(b[a - 1], "on")
}

function dgDate() {
    var c = new Date();
    var b = c.getMonth() + 1;
    var a = c.getDate();

    if (b < 10) {
        b = "0" + b
    }

    if (a < 10) {
        a = "0" + a
    }

    b = b.toString();
    a = a.toString();
    var g = b.substr(0, 1);
    var f = b.substr(1, 1);
    var e = a.substr(0, 1);
    var d = a.substr(1, 1);
    chgImg("month1", g);
    chgImg("month2", f);
    chgImg("day1", e);
    chgImg("day2", d)
}

function chgImg(c, a) {
    var b = $(c);

    if (b && b.src && b.alt) {
        $(c).src = "http://icon.daum-img.net/game/09gamenew/t_num_" + a + ".gif";
        $(c).alt = a
    }
}

function init_dg(a) {}

function addEventDg(b) {
    for (var d = 1; d < 6;

        d++) {
        var c = "dgList" + d;

        $(c).onclick = function (a) {
            if (b == "top") {
                clkDg(this, "top")
            } else {
                clkDg(this)
            }

            daum.Event.preventDefault(a)
        }
    }
}

function clkDg(d, b) {
    var e = d.id;
    var a = e.substr(6, 7) - 1;
    var c = "Daumdate=" + daily_src.dailyData[a].date;
    $("dg_mov").style.display = "block";
    daumFlashGame(daily_src.dailyData[a].flash, "690", "386", "dg_mov", "dailyMOV", "dailyMOV", c);
    $("dailyMOV").focus();

    if (b == "top") {
        checknil(a)
    }
}

function checknil(a) {
    var b = a + 1;
    var c = $("promoL").id || null;
    var d = "/?t__nil_todaygame=" + b;

    if (c) {
        sendDGURL(d)
    }
}

function dailyLayerClose() {}

function showPackInfo(a) {
    hiddenPackInfo();
    var b = "packInfo" + a;
    $(b).style.display = "block"
}

function hiddenPackInfo() {
    var a = $("packInfoArea");
    var c = a.childNodes.length;
    for (var b = 0; b < c;

        b++) {
        if (a.childNodes[b].nodeType == 1 && a.childNodes[b].tagName == "DL") {
            a.childNodes[b].style.display = "none"
        }
    }
}

function list_view(b) {
    var a = daum.$(b).style.display;

    if (a == "block") {
        daum.$(b).style.display = "none"
    } else {
        daum.$(b).style.display = "block"
    }
}

function showPointLayer(e) {
    var d = document.getElementById(e);

    if (document.getElementById("pointLayer")) {
        var a = UI.$("cmt_select");
        var c = UI.$("pointLayer");
        var b = UI.getPosition(a);

        if (c.style.display != "block") {
            c.style.display = "block"
        } else {
            c.style.display = "none"
        }
    }
}

function selPoint(h, g) {
    document.writeCommentForm.point.value = g;

    if (document.getElementById("pointLayer")) {
        var e = document.getElementById("pointLayer");

        if (e.style.display == "block") {
            e.style.display = "none"
        }

        var a = e.getElementsByTagName("SPAN");
        for (var d = 0; d < a.length;

            d++) {
            if (a[d].className.indexOf("Star_bg") != -1 && a[d].className.indexOf("selected") != -1) {
                a[d].className = a[d].className.replace(" selected", "")
            }
        }

        h.className = h.className + " selected";
        var b = document.getElementById("cmt_select");
        var c = g * 10;
        var f = "";
        f + = '<span class="Star_bg">';
        f + = '<span class="star_push" style="width:' + c + '%;"></span>';
        f + = "</span>";
        b.innerHTML = f
    }
}

function open_star_layer() {
    if (UI.$("Layer").style.display != "block") {
        UI.$("Layer").style.display = "block"
    } else {
        UI.$("Layer").style.display = "none"
    }
}

function star_click(b) {
    var a = b * 20;
    UI.$("star").style.width = a + "%";
    pointTemp = b * 2
}

function insertComment() {
    var a = document.writeCommentForm;

    if (a.point.value == "") {
        alert("�먯닔瑜� �좏깮�� 二쇱꽭��.");
        return false
    } else {
        if (UI.trim(a.comment.value) == "") {
            alert("100�먰룊�� �낅젰�� 二쇱꽭��.");
            a.comment.value = "";
            a.comment.focus();
            return false
        } else {
            a.returnUrl.value = a.returnUrl.value + "?type=" + a.pointType.value + "&page=1";
            a.submit()
        }
    }
}

function resizeImg(b, a, d) {
    var c = new Image();
    c.src = b.src;

    if (c.width == 0 || c.height == 0) {
        return
    }

    if (c.width > a || c.height > d) {
        b.width = a;
        b.height = d;

        if ((c.width / a) > (c.height / d)) {
            b.height = Math.round(c.height * (a / c.width))
        } else {
            b.width = Math.round(c.width * (d / c.height))
        }
    } else {
        b.width = c.width;
        b.height = c.height
    }

    if (b.width == 0 || b.height == 0) {
        setTimeout(function () {
                UI.resizeImage(b, a, d)
            }

            , 500)
    }
}

function sc_tab(b, d, g, e) {
    var a;
    var f;
    for (var c = 0; c < d;

        c++) {
        a = g + c;
        f = e + c;

        if (c == b) {
            document.getElementById(f).style.display = "";
            document.getElementById(a).className = "on"
        } else {
            document.getElementById(f).style.display = "none";
            document.getElementById(a).className = ""
        }
    }
}

function sc_tab1(b, d, g, e) {
    var a;
    var f;
    for (var c = 1; c < d + 1;

        c++) {
        a = g + c;
        f = e + c;

        if (c == b) {
            document.getElementById(f).style.display = "block";
            document.getElementById(a).className = "on"
        } else {
            document.getElementById(f).style.display = "none";
            document.getElementById(a).className = "off"
        }
    }
}

function pointSubmit() {
    var a = pointTemp;
    var d = gameIdTemp;
    var b = "/flash/gameNetizenPoint.do?gameId=" + d + "&point=" + a;
    var c = urlTemp;

    if (!nullChk(a)) {
        alert("�먯닔瑜� �낅젰�댁＜�몄슂")
    } else {
        createForm(a, d, c)
    }
}

function createForm(b, f, d) {
    var c = document.createElement("form");
    c.action = "/flash/gameNetizenPoint.do";
    c.method = "post";
    var e = document.createElement("input");
    e.type = "hidden";
    e.name = "gameId";
    e.value = f;
    var a = document.createElement("input");
    a.type = "hidden";
    a.name = "point";
    a.value = b;
    var h = document.createElement("input");
    h.type = "hidden";
    h.name = "url";
    h.value = d;
    c.appendChild(e);
    c.appendChild(a);
    c.appendChild(h);
    var g = document.getElementsByTagName("body")[0];
    g.appendChild(c);
    c.submit()
}

function nullChk(a) {
    if (a == 0 || a == null) {
        return false
    } else {
        return true
    }
}

function setSound(a) {
    document.getElementById("flashGameCont").setSoundEnabled(a);
    isSoundOn = !a;
    chgSoundImg(a)
}

function chgSoundImg(a) {
    if (a) {
        $("btn_fgSound").className = "sound_on"
    } else {
        $("btn_fgSound").className = "sound"
    }
}

function addTrace(a) {}

function daumActiveX(f, h) {
    var c = "<object ";

    if (!f.id && !f.name) {
        var e = Math.round(Math.random() * 100);
        c + = 'id="daumActiveXObject' + e + '" name="daumActiveXObject' + e + '" '
    } else {
        if (f.id) {
            c + = 'id="' + f.id + '" '
        } else {
            c + = 'id="' + f.name + '" '
        }

        if (f.name) {
            c + = 'name="' + f.name + '" '
        } else {
            c + = 'name="' + f.id + '" '
        }
    }

    if (f.type) {
        c + = 'type="' + f.type + '" '
    }

    if (f.classid) {
        c + = 'classid="' + f.classid + '" '
    }

    if (f.width) {
        c + = 'width="' + f.width + '" '
    }

    if (f.height) {
        c + = 'height="' + f.height + '" '
    }

    if (f.codebase) {
        c + = 'codebase="' + f.codebase + '" '
    }

    for (var b in f.events) {
        if (f.events[b]) {
            c + = f.events[b][0] + '="' + f.events[b][1] + '" '
        }
    }

    c + = ">\n";

    for (var b in f.param) {
        c + = '<param name="' + f.param[b][0] + '" value="' + f.param[b][1] + '"/>\n'
    }

    c + = "<embed ";

    if (!f.id && !f.name) {
        var e = Math.round(Math.random() * 100);
        c + = 'id="daumActiveXObject' + e + '" name="daumActiveXObject' + e + '" '
    } else {
        if (f.id) {
            c + = 'id="' + f.id + '" '
        }

        if (f.name) {
            c + = 'name="' + f.name + '" '
        }
    }

    if (f.type) {
        c + = 'type="' + f.type + '" '
    }

    if (f.width) {
        c + = 'width="' + f.width + '" '
    }

    if (f.height) {
        c + = 'height="' + f.height + '" '
    }

    for (var b in f.param) {
        if (f.param[b][0]) {
            if (f.param[b][0] == "movie" || f.param[b][0] == "src") {
                var g = f.param[b][1]
            }

            if (f.param[b][0].toLowerCase() == "flashvars") {
                if (g) {
                    var a = c.split('src="' + g + '"');
                    c = a[0] + ' src="' + g + "?" + f.param[b][1] + '" ' + a[1]
                } else {
                    f.param[f.param.length] = f.param[b]
                }
            } else {
                c + = f.param[b][0] + '="' + f.param[b][1] + '" '
            }
        }
    }

    c + = "/>\n";
    c + = "</object>";
    var d = (document.all) ? true : false;

    if (d) {
        document.getElementById(h).innerHTML = c
    } else {
        if (f.type == "application/x-shockwave-flash" || f.classid.toLowerCase() == "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000") {
            document.getElementById(h).innerHTML = c
        } else {
            if (navigator.platform.indexOf("Win") >= 0 && f.classid.toLowerCase() == "clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95") {
                document.getElementById(h).innerHTML = c
            }
        }
    }
}

function daumFlash(f, b, a, g, d) {
    var c = new Object();
    c.type = "application/x-shockwave-flash";
    c.classid = "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000";
    c.codebase = "http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0";
    c.wmode = "transparent";
    c.width = b;
    c.height = a;
    var e = [["movie",
    f],
    ["src",
    f],
    ["quality",
    "high"],
    ["wmode",
    "transparent"],
    ["bgcolor",
    "#FFFFFF"],
    ["pluginspage",
    "http://www.macromedia.com/go/getflashplayer"],
    ["allowScriptAccess",
    "Always"],
    ["allowFullScreen",
    "true"]];

    if (d) {
        e[e.length] = ["FlashVars",
        d]
    }

    c.param = e;
    daumActiveX(c, g)
}

function daumFlashGame(a, e, l, b, d, c, j, f) {
    var k = f || "window";
    var h = new Object();
    h.type = "application/x-shockwave-flash";
    h.classid = "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000";
    h.codebase = "http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0";
    h.wmode = k;
    h.width = e;
    h.height = l;
    h.id = d;
    h.name = c;
    var g = [["movie",
    a],
    ["src",
    a],
    ["quality",
    "high"],
    ["wmode",
    k],
    ["bgcolor",
    "#FFFFFF"],
    ["pluginspage",
    "http://www.macromedia.com/go/getflashplayer"],
    ["allowScriptAccess",
    "always"]];

    if (j) {
        g[g.length] = ["FlashVars",
        j]
    }

    h.param = g;
    daumActiveXFlashFix(h, b)
}

function daumActiveXFlashFix(e, f) {
    var b = "<object ";

    if (!e.id && !e.name) {
        var d = Math.round(Math.random() * 100);
        b + = 'id="daumActiveXObject' + d + '" name="daumActiveXObject' + d + '" '
    } else {
        var c = (document.all) ? true : false;

        if (c) {
            if (e.id) {
                b + = 'id="' + e.id + '" '
            }

            if (e.name) {
                b + = 'name="' + e.id + '" '
            }
        }
    }

    if (e.type) {
        b + = 'type="' + e.type + '" '
    }

    if (e.classid) {
        b + = 'classid="' + e.classid + '" '
    }

    if (e.width) {
        b + = 'width="' + e.width + '" '
    }

    if (e.height) {
        b + = 'height="' + e.height + '" '
    }

    if (e.codebase) {
        b + = 'codebase="' + e.codebase + '" '
    }

    for (var a in e.events) {
        if (e.events[a]) {
            b + = e.events[a][0] + '="' + e.events[a][1] + '" '
        }
    }

    b + = ">\n";

    for (var a in e.param) {
        if (e.param[a][0] && e.param[a][1]) {
            b + = '<param name="' + e.param[a][0] + '" value="' + e.param[a][1] + '"/>\n'
        }
    }

    b + = "<embed ";

    if (!e.id && !e.name) {
        var d = Math.round(Math.random() * 100);
        b + = 'id="daumActiveXObject' + d + '" name="daumActiveXObject' + d + '" '
    } else {
        if (!c) {
            if (e.id) {
                b + = 'id="' + e.id + '" '
            }

            if (e.name) {
                b + = 'name="' + e.name + '" '
            }
        }
    }

    if (e.type) {
        b + = 'type="' + e.type + '" '
    }

    if (e.width) {
        b + = 'width="' + e.width + '" '
    }

    if (e.height) {
        b + = 'height="' + e.height + '" '
    }

    b + = ' allowScriptAccess="always" ';

    for (var a in e.param) {
        if (e.param[a][0]) {
            e.param[a][0] = e.param[a][0].toLowerCase();

            if (e.param[a][0] == "id" || e.param[a][0] == "name" || e.param[a][0] == "src" || e.param[a][0] == "pluginspage" || e.param[a][0] == "swliveconnect" || e.param[a][0] == "play" || e.param[a][0] == "loop" || e.param[a][0] == "menu" || e.param[a][0] == "quality" || e.param[a][0] == "scale" || e.param[a][0] == "align" || e.param[a][0] == "salign" || e.param[a][0] == "wmode" || e.param[a][0] == "bgcolor" || e.param[a][0] == "base" || e.param[a][0] == "flashvars") {
                b + = e.param[a][0] + '="' + e.param[a][1] + '" '
            }
        }
    }

    b + = "/>\n";
    b + = "</object>";
    var c = (document.all) ? true : false;

    if (c) {
        document.getElementById(f).innerHTML = b
    } else {
        if (e.type == "application/x-shockwave-flash" || e.classid.toLowerCase() == "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000") {
            document.getElementById(f).innerHTML = b
        } else {
            if (navigator.platform.indexOf("Win") >= 0 && e.classid.toLowerCase() == "clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95") {
                document.getElementById(f).innerHTML = b
            }
        }
    }
}

var UI = {}

;

Object.extend = function (d, c) {
    for (var e in c) {
        d[e] = c[e]
    }

    return d
}

;

UI.$ = function (a) {
    return document.getElementById(a)
}

;

UI.trim = function (a) {
    return a.replace(/(^\s*)|(\s*$)/g, "")
}

;

UI.Tab = function (f, d, b) {
    this.options = {
        snum: 1,
        event_type: "mouseover",
        menu_type: "img",
        class_over: "on",
        onChange: null
    }

    ;
    Object.extend(this.options, b);
    this.cid = f;
    this.count = d;
    var e;
    for (var c = 1; c <= d;

        c++) {
        e = UI.$("menu_" + f + "_" + c);
        e.n = c;
        e.css = e.className;
        var a = this;

        e["on" + this.options.event_type] = function () {
            a.on(this.n)
        }
    }

    this.on(this.options.snum)
}

;

UI.Tab.prototype = {
    on: function (c) {
        this.n = c;
        var b = this.options.menu_type;
        for (var a = 1; a <= this.count;

            a++) {
            UI.$("div_" + this.cid + "_" + a).style.display = "none";

            if (b == "img") {
                UI.$("menu_" + this.cid + "_" + a).src = UI.$("menu_" + this.cid + "_" + a).src.replace("on.", "off.")
            } else {
                UI.$("menu_" + this.cid + "_" + a).className = UI.$("menu_" + this.cid + "_" + a).css
            }
        }

        UI.$("div_" + this.cid + "_" + c).style.display = "block";

        if (b == "img") {
            UI.$("menu_" + this.cid + "_" + c).src = UI.$("menu_" + this.cid + "_" + c).src.replace("off.", "on.")
        } else {
            UI.$("menu_" + this.cid + "_" + c).className = UI.$("menu_" + this.cid + "_" + c).css + " " + this.options.class_over
        }

        if (this.options.onChange) {
            this.options.onChange.call(this)
        }
    }
}

;

UI.Rolling = function (f, d, c, e) {
    this.cid = f;
    this.count = d;
    this.n = (e) ? e : "1";
    this.onchange = null;
    for (var b = 1; b <= this.count;

        b++) {
        UI.$(this.cid + "_" + b).style.display = "none"
    }

    UI.$(this.cid + "_" + this.n).style.display = "block";
    this.div = UI.$(this.cid);

    this.div.onmouseover = function () {
        this.isover = true
    }

    ;

    this.div.onmouseout = function () {
        this.isover = false
    }

    ;
    this.btn_next = UI.$("btn_" + this.cid + "_next");
    this.btn_prev = UI.$("btn_" + this.cid + "_prev");
    var a = this;

    if (this.btn_next) {
        this.btn_next.onclick = function () {
            a.next()
        }
    }

    if (this.btn_prev) {
        this.btn_prev.onclick = function () {
            a.prev()
        }
    }

    if (c > 0) {
        setInterval(function () {
                a.play()
            }

            , c)
    }
}

;

UI.Rolling.prototype = {
    play: function () {
            if (this.div.isover) {
                return
            }

            this.next()
        }

        ,
    change: function () {
            if (this.onchange) {
                this.onchange()
            }
        }

        ,
    prev: function () {
            UI.$(this.cid + "_" + this.n).style.display = "none";
            this.n = (this.n == 1) ? this.count : --this.n;
            UI.$(this.cid + "_" + this.n).style.display = "block";
            this.change()
        }

        ,
    next: function () {
            UI.$(this.cid + "_" + this.n).style.display = "none";
            this.n = (this.n == this.count) ? 1 : ++this.n;
            UI.$(this.cid + "_" + this.n).style.display = "block";
            this.change()
        }

        ,
    random: function () {
        var b = Math.round((this.count - 1) * Math.random());
        for (var a = 0; a < b;

            a++) {
            this.next()
        }
    }
}

;

UI.Slider = function (d, a, c) {
    this.options = {
        onSlide: null,
        onChange: null,
        max_value: 100,
        move_value: 5,
        value: 0,
        wheel_area: "",
        mode: 1
    }

    ;
    Object.extend(this.options, c);
    this.value = this.options.value;
    this.max_value = this.options.max_value;
    this.area = UI.$(d);
    this.knob = UI.$(a);
    this.area.width = parseInt(UI.getStyle(this.area, "width"));
    this.area.height = parseInt(UI.getStyle(this.area, "height"));
    this.knob.width = parseInt(UI.getStyle(this.knob, "width"));
    this.knob.height = parseInt(UI.getStyle(this.knob, "height"));
    this.track_length = (this.options.mode == 1) ? this.area.width - this.knob.width : this.area.height - this.knob.height;
    var b = this;

    this.drag = new UI.Drag(a, {
            container: d,
            move_mode: this.mode,
            onDrag: function () {
                    b.slide()
                }

                ,
            onStop: function () {
                b.change()
            }
        }

    );
    this.area.sliderKnob = a;

    UI.addEvent(this.area, "mousedown", function (e) {
            b.moveKnobClientXY.call(b, e)
        }

    );

    UI.addEvent(this.area, "mousewheel", function (e) {
            b.wheelScroll.call(b, e)
        }

    );

    if (this.options.wheel_area) {
        UI.addEvent(UI.$(this.options.wheel_area), "mousewheel", function (e) {
                b.wheelScroll.call(b, e)
            }

        )
    }

    if (this.value > 0) {
        if (this.options.mode == 1) {
            this.knob.style.left = this.val2pos() + "px"
        } else {
            this.knob.style.top = this.val2pos() + "px"
        }
    }
}

;

UI.Slider.prototype = {
    pos2val: function () {
            var a = Math.floor(parseInt(this.getKnobPos()) * this.max_value / this.track_length);

            if (a < 0) {
                a = 0
            } else {
                if (a > this.max_value) {
                    a = this.max_value
                }
            }

            this.value = a;
            return a
        }

        ,
    val2pos: function (a) {
            if (!a) {
                a = this.value
            }

            var b = Math.floor(a * this.track_length / this.max_value);
            return b
        }

        ,
    getKnobPos: function () {
            return (this.options.mode == 1) ? this.knob.style.left : this.knob.style.top
        }

        ,
    setKnobPos: function (a) {
            if (this.options.mode == 1) {
                this.knob.style.left = a + "px"
            } else {
                this.knob.style.top = a + "px"
            }
        }

        ,
    moveKnobClientXY: function (c) {
            var d = c || window.event;
            var b = d.target || d.srcElement;
            var f = 0;
            var a = UI.getScroll();

            if (this.options.mode == 1) {
                f = d.clientX - UI.getPosition(this.area).x + a.left - (this.knob.width / 2);

                if (f < 0) {
                    f = 0
                } else {
                    if (f > this.area.width - this.knob.width) {
                        f = this.area.width - this.knob.width
                    }
                }

                this.setKnobPos(f)
            } else {
                f = d.clientY - UI.getPosition(this.area).y + a.top - (this.knob.height / 2);

                if (f < 0) {
                    f = 0
                } else {
                    if (f > this.area.height - this.knob.height) {
                        f = this.area.height - this.knob.height
                    }
                }

                this.setKnobPos(f)
            }

            this.change()
        }

        ,
    moveKnob: function (a, b) {
            if (a == "up" && this.value < this.max_value) {
                this.value + = this.options.move_value;

                if (this.value > this.max_value) {
                    this.value = this.max_value
                }

                this.setKnobPos(this.val2pos());
                this.change();

                if (b) {
                    UI.stopEvent(b)
                }
            } else {
                if (a == "down" && this.value > 0) {
                    this.value -= this.options.move_value;

                    if (this.value < 0) {
                        this.value = 0
                    }

                    this.setKnobPos(this.val2pos());
                    this.change();

                    if (b) {
                        UI.stopEvent(b)
                    }
                }
            }
        }

        ,
    wheelScroll: function (b) {
            var c = UI.getEventWheel(b);
            var a = (c < 0) ? "up" : "down";
            this.moveKnob(a, b)
        }

        ,
    down: function (b) {
            var a = this;
            a.moveKnob("down");

            UI.s_interval = setInterval(function () {
                    a.moveKnob("down")
                }

                , 100);

            if (!b.isMouseup) {
                UI.addEvent(b, "mouseup", function () {
                        clearInterval(UI.s_interval)
                    }

                );

                UI.addEvent(b, "mouseout", function () {
                        clearInterval(UI.s_interval)
                    }

                );
                b.isMouseup = true
            }
        }

        ,
    up: function (b) {
            var a = this;
            a.moveKnob("up");

            UI.s_interval = setInterval(function () {
                    a.moveKnob("up")
                }

                , 100);

            if (!b.isMouseup) {
                UI.addEvent(b, "mouseup", function () {
                        clearInterval(UI.s_interval)
                    }

                );

                UI.addEvent(b, "mouseout", function () {
                        clearInterval(UI.s_interval)
                    }

                );
                b.isMouseup = true
            }
        }

        ,
    slide: function () {
            this.pos2val();

            if (this.options.onSlide) {
                this.options.onSlide.call(this)
            }
        }

        ,
    change: function () {
        this.pos2val();

        if (this.options.onChange) {
            this.options.onChange.call(this)
        }
    }
}

;

UI.DynamicScript = function (b, a) {
    this.url = b || "";
    this.enc = a || "";
    this.head = document.getElementsByTagName("head").item(0);

    if (this.url) {
        this.call(this.url)
    }
}

;

UI.DynamicScript.prototype = {
    noCacheParam: function () {
            var a = (this.url.indexOf("?") == -1) ? "?" : "&";
            return a + "nOcAchE=" + (new Date()).getTime()
        }

        ,
    call: function (a) {
        try {
            this.head.removeChild(this.script)
        } catch (b) {}

        this.url = a;
        this.script = document.createElement("script");
        this.script.setAttribute("type", "text/javascript");
        this.script.setAttribute("src", this.url + this.noCacheParam());

        if (this.enc) {
            this.script.setAttribute("charset", this.enc)
        }

        this.head.appendChild(this.script)
    }
}

;

UI.GSlide = function (b) {
    var a = this;
    this.obj = UI.$(b.id);
    this.w = b.width;

    if (b.on) {
        UI.MouseOver(this.obj)
    }

    this.x = (b.dir == "prev") ? 2 * this.w : 0;
    this.set();
    clearInterval(this.timer);

    this.timer = setInterval(function () {
            a.sliding()
        }

        , 20)
}

;

UI.GSlide.prototype = {
    sliding: function () {
            var a = this;
            this.x + = (this.w - this.x) * 0.3;
            this.set();

            if (Math.round(this.x) == this.w) {
                clearInterval(this.timer)
            }
        }

        ,
    set: function () {
        this.obj.style.left = -Math.round(this.x) + "px"
    }
}

;

UI.MouseOver = function (a) {
    this.obj = (typeof a == "object") ? a.getElementsByTagName("li") : UI.$(a).getElementsByTagName("li");
    for (i = 0; i < this.obj.length;

        i++) {
        this.obj[i].cname = (this.obj[i].className == "on" || this.obj[i].className == "fir_plus_on") ? true : false;

        this.obj[i].onmouseover = function () {
            if (!this.cname) {
                this.className = (this.className == "fir_plus") ? "fir_plus_on" : "on"
            }
        }

        ;

        this.obj[i].onmouseout = function () {
            if (!this.cname) {
                this.className = (this.className == "fir_plus_on") ? "fir_plus" : ""
            }
        }
    }
}

;

UI.getStyle = function (c, b) {
    var d = c.style[b];

    if (!d) {
        if (document.defaultView && document.defaultView.getComputedStyle) {
            var a = document.defaultView.getComputedStyle(c, null);
            d = a ? a[b] : null
        } else {
            if (c.currentStyle) {
                d = c.currentStyle[b]
            }
        }
    }

    return d == "auto" ? null : d
}

;

UI.getPosition = function (a) {
    var c = 0,
        b = 0;

    while (a) {
        c + = a.offsetLeft || 0;
        b + = a.offsetTop || 0;
        a = a.offsetParent
    }

    return {
        x: c,
        y: b
    }
}

;

UI.Move = function (a) {
    this.id = a;
    this.div = UI.$(a);
    this.x = parseInt(UI.getStyle(this.div, "left")) || 0;
    this.y = parseInt(UI.getStyle(this.div, "top")) || 0
}

;

UI.Move.prototype = {
    slide: function (b) {
            this.pos = b;
            this.pos_n = 0;
            this.speed = 0.3;
            this.inteval = 20;
            this.setPos();
            this.playing = true;
            var a = this;

            this.tid = setInterval(function () {
                    a.play()
                }

                , this.inteval)
        }

        ,
    play: function () {
            this.x + = (this.x2 - this.x) * this.speed;
            this.y + = (this.y2 - this.y) * this.speed;
            this.set(this.x, this.y);

            if (Math.round(this.x) == this.x2 && Math.round(this.y) == this.y2) {
                this.x = Math.round(this.x);
                this.y = Math.round(this.y);
                this.set(this.x, this.y);

                if (this.pos_n >= this.pos.length) {
                    this.playing = false;
                    clearInterval(this.tid)
                } else {
                    this.setPos()
                }
            }
        }

        ,
    setPos: function () {
            var a = this.pos[this.pos_n].split(",");
            this.x2 = a[0];
            this.y2 = a[1];
            this.pos_n + +
        }

        ,
    set: function (a, b) {
        this.div.style.left = a + "px";
        this.div.style.top = b + "px"
    }
}

;

UI.addComma = function (b) {
    b + = "";
    var a = new RegExp("(-?[0-9]+)([0-9]{3})");

    while (a.test(b)) {
        b = b.replace(a, "$1,$2")
    }

    return b
}

;

function CallbackFocusHandler() {}

function noti_pop() {
    if (document.getElementById("noti_layer").style.display == "none") {
        document.getElementById("noti_layer").style.display = "block"
    } else {
        document.getElementById("noti_layer").style.display = "none"
    }
}

function StringBuffer() {
    this.buffer = []
}

StringBuffer.prototype = {
    toString: function () {
            return this.buffer.join("")
        }

        ,
    append: function (a) {
        this.buffer.push(a);
        return this
    }
}

;

var Calender = function (a, b, c) {
    this.UNIQUE_ID = String(Math.random()).substring(2, 6);
    this.PARENT = daum.$(a);
    this.TEXT = daum.$(b);
    this.CSS = c;
    this.CSS_SELECTED = "selected";
    this.CSS_TODAY = "today";
    this.DAY = new Date();
    this.DAY_SWEEK = -1;
    this.DAY_LAST = 0;
    this.TO_DAY = new Date();
    this.TO_DAY_YYYYMMDD = this.getYYYYMMDD(this.TO_DAY);
    this.selectedBox;
    this.selectedDate;
    this.todayBox;
    this.FROM_DATE;
    this.TO_DATE;
    this.createElement()
}

;

Calender.prototype = {
    getYYYYMMDD: function (a) {
            return a.getFullYear() + daum.Number.fillZero(a.getMonth() + 1, 2) + daum.Number.fillZero(a.getDate(), 2)
        }

        ,
    getYYMMDD: function (a) {
            return a.substring(2, 4) + "." + daum.Number.fillZero(a.substring(4, 6), 2) + "." + daum.Number.fillZero(a.substring(6, 8), 2)
        }

        ,
    getLastDay: function (a) {
            return new Date(a.getFullYear(), a.getMonth() + 1, 0).getDate()
        }

        ,
    getSweek: function (a) {
            return new Date(a.getFullYear(), a.getMonth(), 1).getDay()
        }

        ,
    clearSelectedDate: function () {
            this.selectedDate = "";

            if (this.selectedBox) {
                daum.Element.removeClassName(this.selectedBox, this.CSS_SELECTED)
            }
        }

        ,
    validateFormat: function (d, c) {
            var a = null;
            a = d.split(c);

            if (a.length == 3) {
                for (var b = 0; b < a.length;

                    b++) {
                    if (!Number(a[b]) && Number(a[b]) <= 0) {
                        a = null;
                        break
                    }
                }
            } else {
                a = null
            }

            return a
        }

        ,
    validateDate: function (e, d, a) {
            var b,
                c;
            c = (new Date(e, Number(d - 1), a)).getTime();
            b = new Date();
            b.setTime(c);

            if (b.getFullYear() != e) {
                return false
            }

            if (b.getMonth() != Number(d - 1)) {
                return false
            }

            if (b.getDate() != a) {
                return false
            }

            return true
        }

        ,
    setDate: function (c, b) {
            var a = null;
            a = this.validateFormat(c, b);

            if (a != null) {
                if (this.selectedBox) {
                    daum.Element.removeClassName(this.selectedBox, this.CSS_SELECTED)
                }

                if (this.validateDate(a[0], a[1], a[2])) {
                    if (this.todayBox) {
                        daum.Element.removeClassName(this.todayBox, this.CSS_TODAY)
                    }

                    this.selectedDate = a[0] + daum.Number.fillZero(a[1], 2) + daum.Number.fillZero(a[2], 2);
                    this.setCalender(a[0], a[1])
                } else {
                    this.selectedDate = null;
                    alert("�섎せ�� �좎쭨�낅땲��.")
                }
            }

            return a
        }

        ,
    setYYYYMM: function (b, a) {
            if (this.selectedBox) {
                daum.Element.removeClassName(this.selectedBox, this.CSS_SELECTED)
            }

            if (this.todayBox) {
                daum.Element.removeClassName(this.todayBox, this.CSS_TODAY)
            }

            this.setCalender(b, a)
        }

        ,
    setYYYYMMDD: function (c, b, a) {
            this.selectedDate = String(c) + daum.Number.fillZero(b, 2) + daum.Number.fillZero(a, 2);

            if (this.TEXT) {
                this.TEXT.value = this.getYYMMDD(this.selectedDate)
            }

            this.setYYYYMM(c, b)
        }

        ,
    setFromDate: function (a) {
            this.FROM_DATE = (new Date(a.substring(0, 4), a.substring(4, 6), a.substring(6, 8))).getTime()
        }

        ,
    setToDate: function (a) {
            this.TO_DATE = (new Date(a.substring(0, 4), a.substring(4, 6), a.substring(6, 8))).getTime()
        }

        ,
    setToday: function (a) {
            if (this.todayBox) {
                daum.Element.removeClassName(this.todayBox, this.CSS_TODAY)
            }

            this.TO_DAY = new Date(a.substring(0, 4), a.substring(4, 6), a.substring(6, 8));
            this.TO_DAY.setMonth(this.TO_DAY.getMonth() - 1);
            this.TO_DAY_YYYYMMDD = this.getYYYYMMDD(this.TO_DAY);
            this.setCalender(a.substring(0, 4), a.substring(4, 6))
        }

        ,
    setBox: function (d, e, a) {
            if (a == 0 || a == 2) {
                daum.Element.addClassName(d, "dimd")
            } else {
                if (a == 1) {
                    daum.Element.removeClassName(d, "dimd");

                    if (this.TO_DAY_YYYYMMDD == e) {
                        daum.Element.addClassName(d, "today");
                        this.todayBox = d
                    }
                }
            }

            if (this.selectedDate == e) {
                daum.Element.addClassName(d, this.CSS_SELECTED);
                this.selectedBox = d
            }

            d.date = this.getYYMMDD(e);
            d.ymd = e;
            d.innerHTML = Number(e.substring(6, 8));
            var b = this;
            var c = (new Date(e.substring(0, 4), e.substring(4, 6), e.substring(6, 8))).getTime();

            if (b.FROM_DATE <= c && c <= b.TO_DATE) {
                daum.Element.addClassName(d, "pointer");

                d.onclick = function () {
                    location.href = gameurl + "&stdDate=" + d.ymd
                }
            } else {
                daum.Element.removeClassName(d, "pointer");
                d.onclick = null
            }
        }

        ,
    setCalender: function (k, h) {
            this.DAY.setFullYear(k);
            this.DAY.setMonth(h - 1);
            this.DAY.setDate(1);
            this.DAY_SWEEK = this.getSweek(this.DAY);
            this.DAY_LAST = this.getLastDay(this.DAY);
            daum.$("cal_title_" + this.UNIQUE_ID).innerHTML = this.DAY.getFullYear() + "." + daum.Number.fillZero(this.DAY.getMonth() + 1, 2);
            var a = new Date(k, h - 2, 1);
            var c = new Date(k, Number(h) + 1, 1);
            var b = this.getLastDay(a);
            var e,
                d,
                f,
                l;
            var m = daum.$T("tbody", daum.$("calender_" + this.UNIQUE_ID))[0].rows;
            var g = m.length;
            for (e = 0; e < g;

                e++) {
                l = daum.$T("td", m[e]);
                for (d = 0; d < 7;

                    d++) {
                    f = l[d];

                    if (e == 0 && d < this.DAY_SWEEK) {
                        a.setDate(b - (this.DAY_SWEEK - d) + 1);
                        this.setBox(f, this.getYYYYMMDD(a), 0)
                    } else {
                        if ((this.DAY.getMonth() + 1 == c.getMonth()) || (this.DAY.getMonth() + 1 == 12 && c.getMonth() == 0)) {
                            this.setBox(f, this.getYYYYMMDD(c), 2);
                            c.setDate(c.getDate() + 1)
                        } else {
                            this.setBox(f, this.getYYYYMMDD(this.DAY), 1);
                            this.DAY.setDate(this.DAY.getDate() + 1)
                        }
                    }
                }
            }
        }

        ,
    prev: function () {
            if (this.selectedBox) {
                daum.Element.removeClassName(this.selectedBox, this.CSS_SELECTED)
            }

            if (this.todayBox) {
                daum.Element.removeClassName(this.todayBox, this.CSS_TODAY)
            }

            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth() - 1)
        }

        ,
    next: function () {
            if (this.selectedBox) {
                daum.Element.removeClassName(this.selectedBox, this.CSS_SELECTED)
            }

            if (this.todayBox) {
                daum.Element.removeClassName(this.todayBox, this.CSS_TODAY)
            }

            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth() + 1)
        }

        ,
    createElement: function () {
            daum.$(this.PARENT).innerHTML = this.element();
            var a = this;

            daum.Event.addEvent(daum.$("btn_prev_" + this.UNIQUE_ID), "click", function () {
                    a.prev()
                }

            );

            daum.Event.addEvent(daum.$("btn_next_" + this.UNIQUE_ID), "click", function () {
                    a.next()
                }

            );
            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth() + 1)
        }

        ,
    element: function () {
        var a = new StringBuffer();
        a.append('<table id="calender_').append(this.UNIQUE_ID).append('" class="').append(this.CSS).append('">');
        a.append("<thead>");
        a.append("<tr>");
        a.append('<td align="right" colspan="2" style="padding-right:5px"> <button id="btn_prev_').append(this.UNIQUE_ID).append('" type="button" class="prevBtn"> &lt; </button> </td>');
        a.append('<th id="cal_title_').append(this.UNIQUE_ID).append('" colspan="3" class="month"></th>');
        a.append('<td align="left" colspan="2" style="padding-left:5px"> <button id="btn_next_').append(this.UNIQUE_ID).append('" type="button" class="nextBtn"> &gt; </button> </td>');
        a.append("</tr>");
        a.append("<tr>").append('<th class="red">S</th>').append("<th>M</th>").append("<th>T</th>").append("<th>W</th>").append("<th>T</th>").append("<th>F</th>").append("<th>S</th>").append("</tr>");
        a.append("</thead>");
        a.append("<tbody>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("<tr>").append('<td class="red"></td>').append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("<td></td>").append("</tr>");
        a.append("</tbody>");
        a.append("</table>");
        return a.toString()
    }
}

;

var EveryDayCal = function (a) {
    this.BTN_PREV = "btn_prev";
    this.BTN_NEXT = "btn_next";
    this.BTN_TODAY = "btn_today";
    this.ID_YYYY = "t_year";
    this.ID_MM = "t_month";
    this.ID_DD = "t_day";
    this.DAY = new Date();
    this.DAY_SWEEK = -1;
    this.DAY_LAST = 0;
    this.START_YEAR = parseInt(a.substr(0, 4), 10);
    this.START_MONTH = parseInt(a.substr(4, 2), 10);
    this.START_DATE = parseInt(a.substr(6, 2), 10);
    this.START_DAY = new Date(this.START_YEAR, this.START_MONTH - 1, this.START_DATE);
    this.createElement()
}

;

EveryDayCal.prototype = {
    getSweek: function (a) {
            return new Date(a.getFullYear(), a.getMonth(), 1).getDay()
        }

        ,
    getLastDay: function (a) {
            return new Date(a.getFullYear(), a.getMonth() + 1, 0).getDate()
        }

        ,
    createElement: function () {
            var a = this;

            daum.Event.addEvent(daum.$(this.BTN_PREV), "click", function () {
                    a.prev()
                }

            );

            daum.Event.addEvent(daum.$(this.BTN_NEXT), "click", function () {
                    a.next()
                }

            );

            daum.Event.addEvent(daum.$(this.BTN_TODAY), "click", function () {
                    a.today()
                }

            );
            var b = daum.getParam("date") || "";

            if (b.length) {
                this.INIT_YEAR = parseInt(b.substr(0, 4), 10);
                this.INIT_MONTH = parseInt(b.substr(4, 2), 10);
                this.INIT_DATE = parseInt(b.substr(6, 2), 10)
            } else {
                this.INIT_YEAR = this.DAY.getFullYear();
                this.INIT_MONTH = this.DAY.getMonth() + 1;
                this.INIT_DATE = this.DAY.getDate()
            }

            this.DAY.setFullYear(this.INIT_YEAR);
            this.DAY.setMonth(this.INIT_MONTH - 1);
            this.DAY.setDate(this.INIT_DATE);
            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth() + 1)
        }

        ,
    setCalender: function (j, r) {
            this.DAY.setFullYear(j);
            this.DAY.setMonth(r - 1);
            this.DAY.setDate(1);
            this.DAY_SWEEK = this.getSweek(this.DAY);
            this.DAY_LAST = this.getLastDay(this.DAY);
            this.DAY_SEL = this.INIT_DATE < this.DAY_LAST ? this.INIT_DATE : this.DAY_LAST;
            var s = new Date();
            var l = s.getFullYear();
            var k = s.getMonth();
            var t = s.getDate();
            this.refreshTitle("http://icon.daum-img.net/game/09game/todaygame/img_num", "gif");
            var p = new Date(j, r - 2, 1);
            var g = new Date(j, Number(r) + 1, 1);
            var m = this.getLastDay(p);
            var c = this.DAY.getFullYear() < l;
            var o = this.DAY.getFullYear() == l;
            var n = o && this.DAY.getMonth() < k;
            var h = o && this.DAY.getMonth() == k;
            var d = this.DAY.getFullYear() == this.INIT_YEAR && this.DAY.getMonth() + 1 == this.INIT_MONTH;
            var f = daum.Browser.ie6;
            var q = "";
            var b = new Date();
            var a = false;
            var e;
            for (i = 1; i <= this.DAY_LAST;

                i++) {
                e = daum.$("num_" + i);
                b.setFullYear(this.DAY.getFullYear());
                b.setMonth(this.DAY.getMonth());
                b.setDate(i);
                a = b.getTime() > this.START_DAY.getTime();
                q = "";

                if (f) {
                    e.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + i + "_off.gif) no-repeat"
                }

                if (a && (c || n || h)) {
                    q = "on";

                    if (f) {
                        e.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + i + "_on.gif) no-repeat"
                    }
                }

                if (a && (d && i == this.DAY_SEL)) {
                    q = "sel";

                    if (f) {
                        e.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + i + "_sel.gif) no-repeat"
                    }
                }

                if (h && i > t) {
                    q = "";

                    if (f) {
                        e.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + i + "_off.gif) no-repeat"
                    }
                }

                e.className = q;
                e.setAttribute("refCss", q);

                e.onmouseover = e.getAttribute("refCss") == "on" ? e.onmouseover || (function (v) {
                        v = v || window.event;
                        var u = v.srcElement || v.target;
                        u.className = "over";

                        if (daum.Browser.ie6) {
                            u.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + u.title + "_over.gif) no-repeat"
                        }
                    }

                ) : null;

                e.onmouseout = e.getAttribute("refCss") == "on" ? e.onmouseout || (function (v) {
                        v = v || window.event;
                        var u = v.srcElement || v.target;
                        u.className = u.getAttribute("refCss");

                        if (daum.Browser.ie6 && u.className == "on") {
                            u.style.cssText = "background:url(http://icon.daum-img.net/game/09game/todaygame/num" + u.title + "_on.gif) no-repeat"
                        }
                    }

                ) : null;

                e.onclick = e.getAttribute("refCss") == "on" ? function (x) {
                        x = x || window.event;
                        var w = x.srcElement || x.target;
                        var u = parseInt(w.getAttribute("title") || 0, 10);
                        var v = this.DAY.getFullYear() + daum.Number.fillZero(this.DAY.getMonth() + 1, 2) + daum.Number.fillZero(u, 2);
                        location.search = "?gameId=" + daum.getParam("gameId") + "&date=" + v
                    }

                    .bind(this) : null
            }

            for (i = this.DAY_LAST + 1; i < 32;

                i++) {
                e = daum.$("num_" + i);

                if (e) {
                    e.className = "hidden"
                }
            }
        }

        ,
    prev: function () {
            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth())
        }

        ,
    next: function () {
            this.setCalender(this.DAY.getFullYear(), this.DAY.getMonth() + 2)
        }

        ,
    today: function () {
            var a = new Date();
            var b = a.getFullYear() + daum.Number.fillZero(a.getMonth() + 1, 2) + daum.Number.fillZero(a.getDate(), 2);
            location.search = "?gameId=" + daum.getParam("gameId") + "&date=" + b
        }

        ,
    printNumbers: function (d, f, c) {
            var g = d.split("");
            var e = null;
            for (var b = 0, a = g.length; b < a;

                b++) {
                e = $(f + (b + 1));

                if (e) {
                    e.src = c.prefix + g[b] + "." + c.postfix;
                    e.alt = g[b]
                }
            }
        }

        ,
    refreshTitle: function (a, g) {
        var e = {
            prefix: a,
            postfix: g
        }

        ;
        var d = this.DAY;
        var f = d.getFullYear();
        var c = d.getMonth() + 1;
        var b = this.DAY_SEL || d.getDate();
        this.printNumbers(daum.Number.fillZero(f, 4), this.ID_YYYY, e);
        this.printNumbers(daum.Number.fillZero(c, 2), this.ID_MM, e);
        this.printNumbers(daum.Number.fillZero(b, 2), this.ID_DD, e)
    }
}

;
var Browser = new Object();
Browser.isIE = (navigator.userAgent.toLowerCase().indexOf("msie") != -1);
Browser.isIE_SV1 = (navigator.userAgent.toLowerCase().indexOf("sv1") != -1);
Browser.isIE_SV2 = (navigator.userAgent.toLowerCase().indexOf("sv2") != -1);
Browser.isIE_7 = (navigator.userAgent.toLowerCase().indexOf("msie 7") != -1);
Browser.isFirefox = (navigator.userAgent.toLowerCase().indexOf("firefox") != -1);
Browser.isSafari = (navigator.userAgent.toLowerCase().indexOf("safari") != -1);
Browser.isOpera = (navigator.userAgent.toLowerCase().indexOf("opera") != -1);
Browser.isNetscape = (navigator.userAgent.toLowerCase().indexOf("netscape") != -1);
Browser.isEtc = (navigator.userAgent.toLowerCase().indexOf("gecko") != -1 && navigator.userAgent.toLowerCase().indexOf("firefox") == -1 && navigator.userAgent.toLowerCase().indexOf("netscape") == -1);

var gaia = {};

String.prototype.stripHTML = function () {
    var matchTag = /(<([^>]+)>)/g;
    return this.replace(matchTag, "");
};

gaia.updateAbilityOfStickyCheckBox = function () {
    if (document.tx_editor_form.isSticky.checked) {
        document.tx_editor_form.showStickyArticleInAllObjCate.disabled = false;
    } else {
        document.tx_editor_form.showStickyArticleInAllObjCate.disabled = true;
        document.tx_editor_form.showStickyArticleInAllObjCate.checked = false;
    }
}

//------------------------------
// 留덉슦�� �좏깮 蹂듭궗 諛⑹� 湲곕뒫 �쒖옉.
gaia.preventionCopy = function () {
    document.write("<meta http-equiv=\"imagetoolbar\" content=\"no\">");
    document.oncontextmenu = function () {
        return false;
    };
    document.onselectstart = function () {
        return false;
    };
    document.ondragstart = function () {
        return false;
    };
    if (document.addEventListener) {
        document.addEventListener('selectstart', gaia.blockContent, false);
        document.addEventListener('dragstart', gaia.blockContent, false);
        document.addEventListener('contextmenu', gaia.blockContent, false);

        /************************ �ㅼ씠踰ㅽ듃 ************************/
        document.addEventListener('copy', gaia.blockContent, false);
        document.addEventListener('keydown', gaia.blockContent, false);
        /************************ �ㅼ씠踰ㅽ듃 ************************/

        document.onmousedown = gaia.disableselect;
        document.onmouseup = gaia.reEnable;
    } else if (document.attachEvent) {
        document.attachEvent('onselectstart', gaia.blockContent);
        document.attachEvent('ondragstart', gaia.blockContent);
        document.attachEvent('oncontextmenu', gaia.blockContent);

        /************************ �ㅼ씠踰ㅽ듃 ************************/
        document.attachEvent('oncopy', gaia.blockContent);
        /************************ �ㅼ씠踰ㅽ듃 ************************/
    }
};

gaia.blockContent = function (e) {
    /************************ �ㅼ씠踰ㅽ듃 ************************/
    if (e.type == "keydown") {
        if ((!e.ctrlKey && !e.metaKey) || (e.keyCode != 65 && e.keyCode != 97 && e.keyCode != 67 && e.keyCode != 99)) {
            return;
        }
    }
    /************************ �ㅼ씠踰ㅽ듃 ************************/
    if (e.type == "contextmenu") {
        alert('臾대떒蹂듭궗瑜� 留됯린 �꾪빐\n留덉슦�� �쒕옒洹� 湲덉�媛� �ㅼ젙�섏뼱 �덉뒿�덈떎');
    }
    var myformtags = ["input", "textarea", "select", "embed", "object"];
    var e = window.event || e;
    var el = e.srcElement || e.target;
    var tagName = el.tagName.toLowerCase();
    for (var i = myformtags.length - 1; i >= 0; i--) {
        if (myformtags[i] == tagName) return;
    }
    if (e.preventDefault) {
        e.preventDefault();
    }
    if (e.stopPropagation) {
        e.stopPropagation();
    }
    e.returnValue = false;
    e.cancelBubble = true;
}

gaia.disableselect = function (e) {
    var formtags = ["input", "textarea", "select"];

    if (typeof e == "undefined") return;
    var el = e.srcElement || e.target;
    var tagName = el.tagName.toLowerCase();
    for (var i = formtags.length - 1; i >= 0; i--) {
        if (formtags[i] == tagName) return true;
    }
    if (navigator.userAgent.toLowerCase().indexOf("gecko") != -1) {
        document.body.style.MozUserSelect = '';
    }
    return false;
}
gaia.reEnable = function () {
    return true;
}
//留덉슦�� �좏깮 蹂듭궗 諛⑹� 湲곕뒫 ��.
//------------------------------


gaia.getCookie = function (name) {
    name += "=";
    cookie = document.cookie + ";";
    start = cookie.indexOf(name);
    if (start != -1) {
        end = cookie.indexOf(";", start);
        return unescape(cookie.substring(start + name.length, end));
    }
    return "";
};

gaia.setCookie = function (name, value, expires) {
    var d = new Date();
    var day = "";
    if (expires) {
        var today = new Date();
        var expiry = new Date(today.getTime() + expires * 1000);
        day = "expires=" + expiry.toGMTString() + ";";
    }
    document.cookie = name + "=" + escape(value) + "; path=/;" + day;
};

gaia.removeCookie = function (cookieName) {
    document.cookie = cookieName + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

gaia.toggleDisplay = function (id) {
    var element = document.getElementById(id);
    if (element.style.display)
        element.style.display = "";
    else
        element.style.display = "block";
};

gaia.popUp = function (url, width, height) {
    var winObj = window.open(url, "PopUp", "scrollbars=no, resiable=yes, width=" + width + ", height=" + height);
    winObj.focus();
};

gaia.daum_paging_rollover = function (obj, img, type) {
    var imgurl = "http://image.daum-img.net/hanmail/2006_ui/";
    var tmp
    if (type == "on") {
        obj.src = imgurl + img + "_over.gif";
    } else {
        obj.src = imgurl + img + ".gif";
    }
};

// list search sbjCate
gaia.searchSbjCateList = function (formObj) {
    formObj.action = "list";
    formObj.submit();
};

// list
gaia.searchSubmitForm = function (formEl) {
    var errorMessage = null;
    var objFocus = null;
    if (jQuery.trim(formEl.searchInput.value).length == 0) {
        errorMessage = "�댁슜�� �ｌ뼱二쇱꽭��.";
        objFocus = formEl.searchInput;
    }
    if (errorMessage != null) {
        alert(errorMessage);
        objFocus.focus();
        return false;
    }
    return true;
};

// read
gaia.copyURL = {
    call: function (articleId) {
        if (gaia.copyURL.clipboard(articleId)) {
            alert('寃뚯떆臾� 二쇱냼媛� 蹂듭궗�섏뿀�듬땲��. �먰븯�쒕뒗 怨녹뿉 ctrl+v濡� 遺숈뿬�ｌ쑝�몄슂.');
        } else {
            alert('蹂� �쒕퉬�ㅻ뒗 �듭뒪�뚮줈�щ� �댁슜�댁빞留� 媛��ν빀�덈떎.');
        }
    },
    clipboard: function (intext) {
        if (window.clipboardData) {
            window.clipboardData.setData("Text", intext);
            return true;
        } else if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip) return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans) return;
                trans.addDataFlavor('text/unicode');
                var str = new Object();
                var len = new Object();
                var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
                var copytext = intext;
                str.data = copytext;
                trans.setTransferData("text/unicode", str, copytext.length * 2);
                var clipid = Components.interfaces.nsIClipboard;
                if (!clip) return false;
                clip.setData(trans, null, clipid.kGlobalClipboard);
                return true;
            } catch (e) {}
        }
        return false;
    }
};

// �쇰뱶諛� 湲곕뒫�� �щ궡 IP�먯꽌�� �숈옉�섏� �딆뒿�덈떎.
gaia.feedback = {
    isAgreed: false, // 李ъ꽦�щ�
    isDisagreed: false, // 諛섎��щ�
    isRecommended: false, // 異붿쿇�щ�
    divId: null,

    login: function (loginDescription) {
        alert("癒쇱� 濡쒓렇�� �섏뀛�� �⑸땲��.");
    },
    call: function (loginUserId, objectUserId, loginDescription, callUrl, id, mode) {

        gaia.feedback.divId = id;

        // 濡쒓렇�몄껜��
        if (loginUserId == '') {
            gaia.feedback.login(loginDescription);
            return;
        }

        // 蹂몄씤�щ�泥댄겕
        if (loginUserId == objectUserId) {
            alert("�먯떊�� 湲��먮뒗 異붿쿇�섏떎 �� �놁뒿�덈떎");
            return false;
        }
        if (mode == 'article') {
            if (gaia.feedback.isAgreed) {
                alert("�대� �됯��섏뀲�듬땲��");
                return;
            }
            if (gaia.feedback.isDisagreed) {
                alert("�대� �됯��섏뀲�듬땲��");
                return;
            }
            if (gaia.feedback.isRecommended) {
                alert("�대� 異붿쿇�섏뀲�듬땲��");
                return;
            }
        }

        var tmp = callUrl.split("?");
        var url = tmp[0];
        var param = tmp[1];
        new UI.Ajax({
            url: url,
            param: param,
            onComplete: gaia.feedback.callBack
        });
    },
    callBack: function (res) {
        var result = eval('(' + res.responseText + ')');

        if (result.status == '500') {
            alert("�대� �됯��섏뀲�듬땲��.");
            gaia.feedback.isAgreed = true;
            return false;
        } else if (result.status == '600') {
            alert("�대� �됯��섏뀲�듬땲��.");
            gaia.feedback.isDisagreed = true;
            return false;
        } else if (result.status == '700') {
            alert("�대� 異붿쿇�섏뀲�듬땲��.");
            gaia.feedback.isRecommended = true;
            return false;
        } else if (result.status == '300') {
            alert("�ㅻ쪟媛� 諛쒖깮�덉뒿�덈떎. �ㅼ떆 �쒕쾲 �쒕룄�� 二쇱꽭��.");
            return false;
        } else if (result.status == '200') {

            if (!result.commentId) {
                var UsingCookieValueStr = result.bbsId + "_" + result.articleId + "_f";
                var value = gaia.getCookie(UsingCookieValueStr);
                if (value == '') {
                    gaia.setCookie(UsingCookieValueStr, UsingCookieValueStr, 60);
                }
            }

            if (result.mode == 'recommend') {
                document.getElementById(gaia.feedback.divId).innerHTML = result.recommendCount;
                gaia.feedback.isRecommended = true;
            }

            if (result.mode == 'agree') {
                document.getElementById(gaia.feedback.divId).innerHTML = result.agreeCount;
                gaia.feedback.isAgreed = true;
            }

            if (result.mode == 'disagree') {
                document.getElementById(gaia.feedback.divId).innerHTML = result.disagreeCount;
                gaia.feedback.isDisagreed = true;
            }
        }
    }
};

// write
gaia.updateChar = function (FieldName, mententname, textlimitname) {
    var strCount = 0;
    var tempStr, tempStr2;
    for (i = 0; i < document.getElementById(mententname).value.length; i++) {
        tempStr = document.getElementById(mententname).value.charAt(i);
        if (escape(tempStr).length > 4) strCount += 2;
        else strCount += 1;
    }
    if (strCount > FieldName) {

        if (mententname == 'gaiaSubject')
            alert("�쒕ぉ�� " + FieldName + " bytes �댄븯濡� �낅젰�댁＜�쒓린 諛붾엻�덈떎.");
        else if (mententname == 'gaiaContent')
            alert(FieldName + " bytes �댄븯濡� �낅젰�댁＜�쒓린 諛붾엻�덈떎.");
        else
            alert("�볤��� " + FieldName + " bytes �댄븯濡� �낅젰�댁＜�쒓린 諛붾엻�덈떎.");

        strCount = 0;
        tempStr2 = "";
        for (i = 0; i < document.getElementById(mententname).value.length; i++) {
            tempStr = document.getElementById(mententname).value.charAt(i);
            if (escape(tempStr).length > 4) strCount += 2;
            else strCount += 1;
            if (strCount > FieldName) {
                if (escape(tempStr).length > 4) strCount -= 2;
                else strCount -= 1;
                break;
            } else tempStr2 += tempStr;
        }
        document.getElementById(mententname).value = tempStr2;
    }
    document.getElementById(textlimitname).innerHTML = strCount;
};

gaia.add_file = function () {
    var input_add = "<br>URL <input type='text' name='cUrl' >�ㅻ챸<input type='text' name='cTitle'><input type='hidden' name='cMarkingType' value='1'/>"
    document.getElementById("add_area").innerHTML += input_add;
};

gaia.add_relatedContent = function () {
    var input_add = "URL : <input name='url' type='text' value=''><br>" +
        "title : <input name='title' type='text' value=''><br>" +
        "imageUrl : <input name='imageUrl' type='text' value=''><br>" +
        "type : <input name='relatedContentType' type='text' value=''><br>" +
        "author : <input name='author' type='text' value=''><br>" +
        "displayOrder : <input name='displayOrder' type='text' value=''><br>" +
        "-----------------------------------<br>";
    document.getElementById("add_area").innerHTML += input_add;
};

gaia.blogPostion = function (url, isChecked, multi_post_layer) {
    document.getElementById(multi_post_layer).style.display = 'block';
    if (isChecked) {
        document.getElementById(multi_post_layer).innerHTML =
            '<input type="hidden" id="blogCategoryId" name="blogCategoryId" value="0"><input type="hidden" id="blogArticleOpen" name="blogArticleOpen" value="A"><iframe name="blogpost_prepare" src="' + url + '" width="100%" height="62" border="0" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>';
    } else {
        document.getElementById(multi_post_layer).style.display = 'none';
    }
};

gaia.file = {
    fileObjName: "file0",

    createFileObj: function () {
        var num = String(parseInt(gaia.file.fileObjName.substring(4, gaia.file.fileObjName.length)) + 1);
        var str = "";
        var fileName = "file" + num;
        var newDiv = document.createElement("DIV");
        newDiv.id = "filelist" + num;
        newDiv.style.paddingBottom = '4px';
        document.getElementById("filesDiv").appendChild(newDiv);
        str = "<input type='file' name='file" + num + "' id='file" + num + "' size='32'>";
        str += " <a href='javascript:gaia.file.removeFileObj(" + num + ")'><img src='http://i1.daumcdn.net/icon/gaia/bt_delete.gif' width='37' height='20' border=0 alt='챙혗짯챙혻혵' /></a>";
        document.getElementById("filelist" + num).innerHTML = str;

        fileObjName = fileName;
    },

    removeFileObj: function (num) {
        document.getElementById("filelist" + num).innerHTML = "";
        document.getElementById("filelist" + num).style.display = 'none';
    },

    removeFileObj2: function () {
        var v = document.getElementById('fileid').checked;
        if (v == true) {
            document.getElementById('filelist0').style.display = "";
        } else {
            document.getElementById('filelist0').style.display = "none";
        }
        removeFileObj();
    }
};


gaia.snsPosting = {
    connectionCheck: function (input, bbsId, connectionisEnabled, serviceName) {
        if (input.checked) {
            if (connectionisEnabled != "true")
                gaia.popUp("http://profile.daum.net/api/popup/JoinProfile.daum?service_name=" + serviceName + "&callback=SNSProfileCallBack", 300, 300);
        }
    }
};

gaia.commentReply = {
    displayFrom: function (id, type) {
        document.getElementById("id").value = id;
        var replyWrap = document.getElementById('rct_' + id);
        var replyForm = document.getElementById('updateCmtArea');
        replyWrap.appendChild(replyForm);
        replyForm.style.display = "block";
        gaia.commentListResize();
    },

    hiddenForm: function (id, type) {
        var replyForm = document.getElementById('updateCmtArea');
        replyForm.style.display = "none";
        gaia.commentListResize();
    },

    submit: function (id) {
        var errorMessage = null;
        var objFocus = null;
        var cmtText = document.getElementById("recomment");
        var stripCmtText = cmtText.value.stripHTML();
        if (cmtText.value.length == 0) {
            errorMessage = "�댁슜�� �ｌ뼱二쇱꽭��.";
            alert(errorMessage);
            cmtText.focus();
        } else if (stripCmtText.length == 0) {
            cmtText.value = stripCmtText;
            alert("html �쒓렇�� �덉슜�섏� �딆뒿�덈떎.");
            cmtText.focus();
        } else {
            document.updateCommentForm.action = "commentReply";
            if (gaia.commentWrite.checkBadKeyword(document.updateCommentForm, cmtText.value))
                document.updateCommentForm.submit();
            else
                cmtText.focus();
        }
    }
};

gaia.commentWrite = {

    user_login_info: 0, // 0:誘몃줈洹몄씤 1:濡쒓렇�� 2:蹂몄씤�뺤씤�꾩슂

    invalidWordPatterns: [/^<$/, /^<!$/, /^<!-+$/],

    isInvaliedWord: function (word) {
        var invaliedPatterns = gaia.commentWrite.invalidWordPatterns;
        for (var i = 0, len = invaliedPatterns.length; i < len; i++) {
            if (invaliedPatterns[i].test(word)) {
                return true
            }
        }
        return false;
    },

    submitForm: function (cmtText_id) {
        var errorMessage = null;
        var objFocus = null;
        var cmtText = document.getElementById(cmtText_id);
        var cmtSubject = document.getElementById("subject");
        var stripCmtText = cmtText.value.stripHTML();

        if (cmtSubject && cmtSubject.value.length == 0) {
            errorMessage = "�쒕ぉ�� �ｌ뼱二쇱꽭��.";
            objFocus = cmtSubject;
        } else if (jQuery.trim(cmtText.value).length == 0) {
            errorMessage = "�댁슜�� �ｌ뼱二쇱꽭��.";
            objFocus = cmtText;
        } else if (cmtText.value.indexOf("&#8238") != -1) {
            errorMessage = "�댁슜�� &#8238�� �낅젰�� �� �놁뒿�덈떎";
            objFocus = cmtSubject;
        } else if (jQuery.trim(stripCmtText) == 0) {
            cmtText.value = stripCmtText;
            errorMessage = "html �쒓렇�� �덉슜�섏� �딆뒿�덈떎.";
            objFocus = cmtText;
        } else if (gaia.commentWrite.isInvaliedWord(jQuery.trim(stripCmtText))) {
            cmtText.value = stripCmtText;
            errorMessage = "�덉슜�섏� �딅뒗 臾몄옄�낅땲��.";
            objFocus = cmtText;
        }

        if (errorMessage != null) {
            alert(errorMessage);
            objFocus.focus();
            return false;
        } else {
            var cmtAll = cmtText.value;
            if (cmtSubject) {
                cmtAll = cmtSubject.value + cmtText.value;
            }
            return gaia.commentWrite.checkBadKeyword(document.writeCommentForm, cmtAll);
        }
    },

    checkLogin: function (loginURL, id) {
        if (gaia.commentWrite.user_login_info == 0) {
            if (confirm("로그인 하시겠습니까?")) {
                top.location = loginURL + escape(parent.document.location.href.split("#")[0] + '#commentFrame');
            } else {
                document.getElementById(id).value = '';
                document.getElementById(id).blur();
            }
        }
    },

    alertLogin: function (id, message) {
        if (gaia.commentWrite.user_login_info == 0) {
            alert(message);
            document.getElementById(id).value = '';
            document.getElementById(id).blur();
        }
    },

    // �볤� �댁슜 以� 湲덉튃�� 泥댄겕
    checkBadKeyword: function (form, cmtText) {
        var obj = null;
        var url = "/gaia/do/forbiddenKeyword";
        var param = "bbsId=" + form.bbsId.value + "&content=" + encodeURIComponent(cmtText);
        var succeed = false;

        var ajax = new gaia.Ajax({
            url: url,
            method: "POST",
            async: false,
            paramString: param,
            onsuccess: function (r) {
                var obj = eval('(' + r.responseText + ')');
                if (obj.badStatus == 400) {
                    succeed = true;
                } else {
                    // 湲덉튃��
                    alert('湲덉튃�닿� �덉뒿�덈떎.');
                    succeed = false;
                }
            }
        }).request();
        return succeed;
    }
}

gaia.commentListResize = function () {

    if (parent.document.getElementById("commentFrame")) {
        var oBody = document.body;
        oBody.style.top = '0';
        var height, width;
        if (navigator.userAgent.indexOf("MSIE") == -1) {
            height = oBody.scrollHeight;
        } else {
            height = oBody.scrollHeight + oBody.offsetHeight - oBody.clientHeight;
        }
        parent.document.getElementById("commentFrame").height = height + 10;


    }
}

gaia.resizePopup = function (size) {
    var h = 0;
    var popHeight = document.getElementById("popWrap").offsetHeight + 34;

    if (Browser.isIE_SV1) {
        h = 14;
    } else if (Browser.isIE_7) {
        h = 18;
    } else if (Browser.isEtc) {
        h = 22;
    } else if (Browser.isFirefox) {
        h = 32;
    } else if (Browser.isNetscape) {
        h = -2;
    } else if (Browser.isOpera) {
        h = 26;
    } else {
        h = 0;
    }
    window.resizeTo(size, popHeight + h);
}

gaia.refreshClose = function () {

    opener.gaia.commentWrite.user_login_info = 1; // 0:誘몃줈洹몄씤 1:濡쒓렇��

    // window.opener.location.reload();
    window.close();
}

gaia.chkCclCode = function () {
    var cc = dd = s = '';
    if (UI.$('cclComUseY').checked) cc = '';
    else if (UI.$('cclComUseN').checked) cc = '-nc'

    if (UI.$('cclChgY').checked) dd = '';
    else if (UI.$('cclChgN').checked) dd = '-nd'
    else if (UI.$('cclChgP').checked) dd = '-sa'

    if (UI.$('ccl').checked) s = 'by' + cc + dd;
    else s = 'na';
    var f = document.forms['tx_editor_form'];
    f.cclCode.value = s;
}

gaia.setCCLOption = function (curObj) {
    var cclComUseN = document.getElementById('imgCclComUseN');
    var cclChgN = document.getElementById('imgCclChgN');
    var cclChgP = document.getElementById('imgCclChgP');

    var id = curObj.id
    switch (id) {
        case "cclComUseN":
            cclComUseN.style.display = "block";
            break;
        case "cclComUseY":
            cclComUseN.style.display = "none";
            break;
        case "cclChgY":
            cclChgN.style.display = "none";
            cclChgP.style.display = "none";
            break;
        case "cclChgN":
            cclChgP.style.display = "none";
            cclChgN.style.display = "block";
            break;
        case "cclChgP":
            cclChgN.style.display = "none";
            cclChgP.style.display = "block";
            break;
        default:
            cclComUseN.style.display = "block";
            cclChgN.style.display = "block";
            break;
    }
}

// jes
if (typeof (UI) == "undefined") var UI = {};
Object.extend = function (a, b) {
    for (var property in b) a[property] = b[property];
    return a;
};

UI.$ = function (s) {
    return document.getElementById(s)
};
UI.toogle = function (id) {
    UI.$(id).style.display = (UI.getStyle(UI.$(id), 'display') == 'none') ? 'block' : 'none'
};
UI.getStyle = function (el, style) {
    // prototype.js
    var value = el.style[style];
    if (!value) {
        if (document.defaultView && document.defaultView.getComputedStyle) {
            var css = document.defaultView.getComputedStyle(el, null);
            value = css ? css[style] : null;
        } else if (el.currentStyle) value = el.currentStyle[style];
    }
    return value == 'auto' ? null : value;
};

UI.Ajax = function (options) {
    this.options = {
        method: 'GET',
        param: '',
        onComplete: null,
        onError: null,
        asynchronous: true,
        contentType: 'application/x-www-form-urlencoded',
        encoding: 'UTF-8'
    }
    Object.extend(this.options, options);
    if (this.options.url) this.send();
};
UI.Ajax.prototype = {
    getReq: function () {
        var req = null;
        try {
            req = new XMLHttpRequest();
        } catch (e) {
            try {
                req = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
        return req;
    },
    send: function () {
        this.req = this.getReq();
        var op = this.options;
        var url = op.url;
        var param = op.param;
        var method = op.method.toUpperCase();
        if (method == 'GET' && param) url = url + "?" + param;
        this.req.open(method, url, op.asynchronous);
        this.req.setRequestHeader('Content-Type', op.contentType + ';charset=' + op.encoding);

        var self = this;
        this.req.onreadystatechange = function () {
            self.onStateChange.call(self)
        }
        this.req.send(method == 'POST' ? param : null);
    },
    onStateChange: function () {
        if (this.req.readyState == 4) {
            if (this.req.status == "200") this.options.onComplete(this.req);
            else {
                if (this.options.onError) this.options.onError(this.req);
                else alert("�쒕쾭�먮윭�낅땲��! �좎떆�꾩뿉 �ㅼ떆 �쒕룄�섏꽭��! " + this.req.status);
            }
        }
    }
};


// from jigu
gaia.extend = function (a, b) {
    for (var property in b) a[property] = b[property];
    return a;
};

gaia.Ajax = function (_options) {
    this.options = {
        url: '',
        method: 'get',
        async: true,
        paramString: '',
        encoding: 'utf-8',
        onsuccess: function () {},
        onfailure: function () {},
        onloading: function () {},
        headers: {}
    }

    gaia.extend(this.options, _options || {});
    this.init();
}
gaia.Ajax.prototype = {
    init: function () {
        if (window.XMLHttpRequest) {
            this.XHR = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            try {
                this.XHR = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    this.XHR = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    this.XHR = null;
                }
            }
        }
        if (!this.XHR) {
            return false;
        };
    },
    request: function (url1, options) {
        this.setOptions(options);
        var url = url1 || this.options.url;
        if (this.options.paramString.length > 0 && this.options.method == 'get') {
            url = url + ((url.indexOf('?') > 0) ? '&' : '?') + this.options.paramString;
        }
        this.open(url);
    },
    open: function (url) {
        var self = this;
        if (this.options.async) {
            this.XHR.onreadystatechange = function () {
                self.stateHandle.call(self);
            };
        }
        this.XHR.open(this.options.method, url, this.options.async);
        var headers = this.options.headers;
        for (var v in headers) {
            this.XHR.setRequestHeader(v, headers[v]);
        }
        this.XHR.send(this.options.paramString);
        if (!this.options.async) this.stateHandle();
    },
    abort: function () {
        if (this.XHR) {
            this.XHR.abort();
            this.callTimeout();
        }
    },
    stateHandle: function (e) {
        switch (this.XHR.readyState) {
            case 4:
                window.clearTimeout(this.options.timer);
                this.options.timer = null;
                if (this.XHR.status == 200 || this.XHR.status == 304) {
                    this.callSuccess();
                } else if (this.XHR.status >= 400) {
                    this.callFailure(this.XHR.status);
                }
                break;

            case 1:
                this.callLoading();
                break;
        }
    },
    callSuccess: function () {
        this.options.onsuccess(this.XHR);
    },
    callFailure: function () {
        this.options.onfailure(this.XHR);
    },
    callLoading: function () {
        this.options.onloading(this.XHR);
    },
    setOptions: function (options) {
        gaia.extend(this.options, options || {});
        this.options.method = this.options.method.toLowerCase();
        // header �뺤쓽
        this.setHeader('charset', this.options.encoding);
        if (this.options.method == 'post') {
            this.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        }
    },
    setHeader: function (key, value) {
        if (typeof key === 'object') {
            // header瑜� �뗮똿�섍퀬 �닿쾬�� open�쒖뿉 泥④��쒕떎.
            gaia.extend(this.options.headers, key || {}, true);
        } else {
            this.options.headers[key] = value;
        }
        return this;
    }
};


gaia.CommentLoader = function () {
    this.depthOffsetParam = 0;
    this.printedCommentCount = 0

    this.loadMoreComments = function (articleId, bbsId, depthOffset, commentTotalCount, mobileCommentPageCount) {
        if (commentTotalCount <= commentLoader.printedCommentCount + mobileCommentPageCount) {
            alert("�� 遺덈윭�� �볤��� �놁뒿�덈떎.");
            return;
        }
        var loadingMsg = "�볤� 遺덈윭�ㅻ뒗 以�...";
        var templatePath = "partial/";
        document.getElementById("commentLoadingMessage").innerHTML = loadingMsg;

        new UI.Ajax({
            url: templatePath + 'commentList',
            param: 'bbsId=' + bbsId + '&articleId=' + articleId + '&depthOffset=' + depthOffset,
            onComplete: this.appendComments
        });

        commentLoader.printedCommentCount += mobileCommentPageCount;
        document.getElementById("loadMoreCommentButton").onclick = function () {
            commentLoader.loadMoreComments(articleId, bbsId, commentLoader.depthOffsetParam, commentTotalCount, mobileCommentPageCount);
        }
    }
    this.appendComments = function (req) {
        var str = req.responseText;
        str = str.substr(str.indexOf("<dl"))
        var commentRoot = document.getElementById("form1");
        commentRoot.innerHTML += str;

        document.getElementById("commentLoadingMessage").innerHTML = "";
        commentLoader.depthOffsetParam = commentRoot.lastChild.previousSibling.previousElementSibling.id;
    }

    this.loadFirstCommentList = function (articleId, bbsId, depthOffset, commentTotalCount, mobileCommentPageCount) {
        if (commentTotalCount <= printedCommentCount) {
            alert("�� 遺덈윭�� �볤��� �놁뒿�덈떎.");
            return;
        }
        var loadingMsg = "�볤� 遺덈윭�ㅻ뒗 以�...";
        var templatePath = "partial/";
        document.getElementById("commentLoadingMessage").innerHTML = loadingMsg;
        new UI.Ajax({
            url: templatePath + 'commentList',
            param: 'bbsId=' + bbsId + '&articleId=' + ariticleId,
            onComplete: this.appendComments
        });
        this.printedCommentCount += mobileCommentPageCount;

        document.getElementById("loadMoreCommentButton").onclick = function () {
            commentLoader.loadMoreComments(articleId, bbsId, this.depthOffsetParam, commentTotalCount, mobileCommentPageCount);
        }
    }
};

var commentLoader = new gaia.CommentLoader();

gaia.reportClaim = function (claimUrl) {
    top.location = claimUrl + "&returnUrl=" + encodeURIComponent(top.location);
};

gaia.voiceReco = {
    daumglueUrl: "daumglue://daum.voiceReco/reco?onSuccess=gaia.voiceReco.onSuccess&onError=gaia.voiceReco.onError&tiaraServiceKey=$voiceRecoTiaraServiceKey&title=�볤��낅젰&guide=�볤��꾩엯�ν빐二쇱꽭��&recoTimeoutSec=10",
    commentTextarea: "",
    open: function (commentTextarea) {
        this.commentTextarea = commentTextarea;

        // �쒕쾭�ㅺ� 吏�湲� �뚯꽦 �볤��� �ъ슜 �� �� �덈뒗吏�瑜� �뺤씤
        var daumGlueFFlag = gaia.getCookie("daumGlueFFlag");

        //�ㅼ쓬 �깆씤吏� �뺤씤
        if (!daumGlueFFlag) {
            // �ㅼ쓬 �� �ㅼ튂 �좊룄
            alert('�ㅼ쓬�깆뿉�� �뚯꽦�볤��� �④꺼蹂댁꽭��!');
            // web2app 湲곕뒫 異붽�
        } else {
            // 諛쏆븘�곌린 媛��ν븳吏� �뺤씤
            if (daumGlueFFlag & 0x0400) {
                // 諛쏆븘�곌린 吏���
                top.location = this.daumglueUrl + "&serviceType=dictation";
            }
            // �뚯꽦�낅젰 媛��ν븳吏� �뺤씤
            else if (daumGlueFFlag & 0x4) {
                // �뚯꽦�몄떇 吏���
                top.location = this.daumglueUrl + "&serviceType=web";
            } else {
                // �뚯꽦吏��먯븞��. �ㅼ쓬 �� �낃� �좊룄
                alert('�ㅼ쓬�� �낅뜲�댄듃 遺��곷뱶由쎈땲��.');
                // 留덉폆�쇰줈 �대룞
            }
        }
    },
    onSuccess: function (str) {
        this.commentTextarea.value = (this.commentTextarea.value + " " + str.selected.value).trim();
    },
    onError: function () {
        alert(daum.toJSON(str.errMsg.value));
    }
};

gaia.articleDelete = function (a) {
    if (confirm("�뺣쭚 ��젣�섏떆寃좎뒿�덇퉴?")) {
        a = a.replace(/&searchKey=userid/, '').replace(/&searchValue=.+&/, '&');
        document.location.href = "delete?" + a;
    }
};

gaia.loginWithReturnUrl = function (loginUrl, returnUrl) {
    var currentUrl = location.href;
    top.location.href = loginUrl + encodeURIComponent(currentUrl.substr(0, currentUrl.lastIndexOf("/") + 1) + returnUrl);
};
