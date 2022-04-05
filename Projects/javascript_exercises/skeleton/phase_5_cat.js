function Cat (name, owner) {
    this.name = name;
    this.owner = owner;
};

Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`
};

let fluff = new Cat('fluff', 'eric');
console.log(fluff.cuteStatement());

let wiskers = new Cat('wiskers', 'jordan');
console.log(wiskers.cuteStatement());

Cat.prototype.cuteStatement = function() {
    return `Everyone loves ${this.name}`
};

console.log(fluff.cuteStatement());

console.log(wiskers.cuteStatement());

Cat.prototype.meow = function() {
    return 'meowww';
};

console.log(fluff.meow());

fluff.meow = function() {
    return 'furrball';
}

console.log(fluff.meow());
console.log(wiskers.meow());