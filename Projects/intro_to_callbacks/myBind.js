Function.prototype.myBind = function(context) {
    return () => this.apply(context);
}
  
//   class Cat {
//     constructor(name) {
//       this.name = name;
//     }
  
//     meow() {
//       console.log(`${this.name} says meow!`);
//     }
//   }
  
//   const curie = new Cat("Curie");
//   setTimeout(curie.meow.myBind(curie), 1000);

  class Lamp {
    constructor() {
      this.name = "a lamp";
    }
  }
  
  const turnOn = function() {
    console.log("Turning on " + this.name);
  };
  
  const lamp = new Lamp();
  
  turnOn(); // should not work the way we want it to
  
  const boundTurnOn = turnOn.bind(lamp);
  const myBoundTurnOn = turnOn.myBind(lamp);
  
  boundTurnOn(); // should say "Turning on a lamp"
  myBoundTurnOn(); // should say "Turning on a lamp"