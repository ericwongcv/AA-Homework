// Phase I: Callbacks

function titleize(names, fnc) {
    let titiledArr = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    titiledArr.forEach(ele => {
        return fnc(ele);
    });
        
    }

const printCallBack = (ele) => { console.log(ele) };

// console.log(titleize(["Mary", "Brian", "Leo"], printCallBack));


// PHASE II: Constructors, Prototypes, and this
function Elephant(name, height, tricks) {
        this.name = name;
        this.height = height;
        this.tricks = tricks;       
    }

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
    return this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
    return this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    return console.log(this.tricks[Math.floor(Math.random() * this.tricks.length)]);
}

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);

// ellie.addTrick('Jump around');
// ellie.play();
// console.log(ellie.height);
// ellie.grow();
// console.log(ellie.height);
// ellie.trumpet();



// PHASE III - FUNCTION INVOCATION

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(object) {
    console.log(`${object.name} is trotting by!`);
}

// Elephant.paradeHelper(micah);

// herd.forEach( elephant => Elephant.paradeHelper(elephant));


// Phase IV: Closures

function dinnerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please";

    console.log(order);

    return function(food) {  
        order = `${order.slice(0, order.length - 8)} and ${food} please`;
        console.log(order);
    }
}

let bfastOrder = dinnerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");


