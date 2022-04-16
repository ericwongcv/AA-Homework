Function.prototype.inherits = function (SuperClass) {
    function Surrogate () {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

Function.prototype.newInherits = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype);
    this.prototype.constructor = this;
}

function MovingObject (direction) {
    this.direction = direction;
}

MovingObject.prototype.speed = function () {
    console.log(`moving ${this.direction} at high speed!`);
}

function Ship (direction) {
    MovingObject.call(this, direction);
}

Ship.newInherits(MovingObject);

const s = new Ship('left');
s.speed();