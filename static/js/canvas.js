//绑定keydown事件
var change = false;
$('canvas').attr("tabIndex",1).keydown(function(e){
    e.preventDefault();
    keyMove(e);
    change = true;
});
//简单的逻辑？
//当用户单击键盘时触发周期性定时器 且只触发一次
var i = 0;
function changed(){
    setInterval(function(){
        i++;
        var str = `0${i}s`;
        $('[class=my_time]').html(str);
    },1000);
}
var canv = document.getElementById("myCanvas");
var cell_width = cell_height = 5;
var edge_blank = cell_width;
var clear_width = cell_width * 2 - 2;
var clear_height = cell_height * 2 - 2;
// 最大逻辑坐标, 坐标起始于 0, 终于 xe, ye
var xe = Math.floor(canv.width / cell_width - 2);
var ye = Math.floor(canv.height / cell_height - 2);
var ctx = canv.getContext("2d");
ctx.beginPath();
var x_end = edge_blank + (xe - 1) * cell_width,
    y_end = edge_blank + (ye - 1) * cell_height;
for (var y = edge_blank + cell_height; y <= y_end; y += 2 * cell_height) {
    ctx.moveTo(edge_blank + cell_width, y);
    ctx.lineTo(x_end, y);
}
for (var x = edge_blank + cell_width; x <= x_end; x += 2 * cell_width) {
    ctx.moveTo(x, edge_blank + cell_height);
    ctx.lineTo(x, y_end);
}
ctx.strokeStyle = "black";
ctx.stroke();
var maze = Array(xe + 1);
for (var i = 0; i <= xe; i++) {
    maze[i] = Array(ye + 1);
    for (var j = 0; j <= ye; j++) {
        maze[i][j] = {road: false, gen: false};
    }
}
var dirs = [], cells = [];
var step = {1: 'y-=2', 2: 'x-=2', 4: 'x+=2', 8: 'y+=2'};
var r_step = {1: 'y+=1', 2: 'x+=1', 4: 'x-=1', 8: 'y-=1'};
var x = y = 2;
var item_last, dir, visit, randS, randE, dc;
while (true) {
    if (maze[x][y].gen) {
        if (dirs[dirs.length - 1] == 0xf) {
            dirs.pop();
            cells.pop();
            if (cells.length == 0) {
                // alert('Maze generation completed');
                break;
            }
            item_last = cells[cells.length - 1];
            x = item_last.x;
            y = item_last.y;
        } else {
            item_last = cells[cells.length - 1];
            x = item_last.x;
            y = item_last.y;
            dir = dirs[dirs.length - 1];
            visit = 1;
            randS = Math.round(Math.random() * 3);
            randE = randS | 4;
            for (var i = randS; i < randE; i++) {
                if (visit != 0) {
                    dc = 1 << (i & 3);
                    visit = dir & dc;
                    dir |= dc;
                    if (visit == 0) {
                        eval(step[dc]);
                        dirs[dirs.length - 1] = dir; // dirs.pop(); dirs.push(dir);
                    }
                }
            }
        }
    } else { // 可通行点
        if (!(0 < x && x < xe && 0 < y && y < ye)) {
            item_last = cells[cells.length - 1];
            x = item_last.x;
            y = item_last.y;
        } else {
            cells.push({x: x, y: y});
            maze[x][y].gen = true;
            for (var i = 0; i < 2; i++) {
                maze[x][y].road = true;
                clearWall(x, y);
                eval(r_step[dc]);
            }
            eval(step[dc]);
            dc = 1 << Math.round(Math.random() * 3);
            dirs.push(dc);
            eval(step[dc]);
        }
    }
}
var doors = [];
for (var i = 0; i < 2; i++) {
    while (true) {
        x = [2, xe - 2][i];
        y = Math.round(Math.random() * (ye - 2 - 2));
        if (maze[x][y].road) {
            maze[x + (x < xe / 2 ? -1 : 1)][y].road = true;
            doors.push({x: x + (x < xe / 2 ? -1 : 1), y: y});
            break;
        }
    }
}
doors.map(function (item) {
    clearWall(item.x, item.y);
});
if (Math.random() > 0.5) {
    var ot = doors[0];
    doors[0] = doors[1];
    doors[1] = ot;
}
var man_pos = doors[0];
man.style.display = 'block';
man.style.backgroundColor = 'red';
man.style.width = cell_width + 'px';
man.style.height = cell_height + 'px';
with (doors[0]) {
    man.style.left = (edge_blank + (x - 0.5) * cell_width + 1) + 'px';
    man.style.top = (edge_blank + (y - 0.5) * cell_height + 1) + 'px';
}

function clearWall(x, y) {
    ctx.clearRect(edge_blank + (x - 1) * cell_width + 1, edge_blank + (y - 1) * cell_height + 1, clear_width, clear_height);
}
// 左上右下: 37,38,39,40
function keyMove(event)
{
    var codes = {37: {prop: 'x', dd: -1}, 39: {prop: 'x', dd: 1}, 38: {prop: 'y', dd: -1}, 40: {prop: 'y', dd: 1}};
    var k = event.keyCode;
    man_pos[codes[k].prop] += codes[k].dd;
    if (!maze[man_pos.x][man_pos.y].road) {
        man_pos[codes[k].prop] -= codes[k].dd;
    }
    if (man_pos.x === doors[1].x && man_pos.y === doors[1].y) {
        success.style.display = 'block';
    }

    with (man_pos) {
        man.style.left = (edge_blank + (x - 0.5) * cell_width + 1) + 'px';
        man.style.top = (edge_blank + (y - 0.5) * cell_height + 1) + 'px';
    }
}
//使用canvas进行描绘矩形
/*
(function(){
    var c = $('#myCanvas')[0];
    var ctx = c.getContext("2d");
    ctx.fillStyle = "#ff0000";
    ctx.fillRect(0,0,150,75);
})();
*/
//浏览器的渲染机制：在渲染的过程中：先执行事件绑定 执行所有的JS代码 与加载DOM同步 当浏览器在渲染的过程中发现没有ID
//然后执行代码报错 （前提:绑定事件的ID是在通过ajax引入的HTML代码片段上 就导致渲染不出从而报错）
//错误：通过 原生DOM操作 console.log()返回null 通过jquery操作 返回undefined
//解决方式：不使用ajax引入 直接将html片段放在它应该在的地方 当然这样不好 还有什么别的办法 求大牛告知？
//进行键盘事件前提：必须首先或的焦点 DIV获得焦点的方式tabIndex = 1即可
//同样：事件的绑定元素 必须一开始就存在DOM书上 而不是通过ajax后期的引入的HTML代码片段上
//测试