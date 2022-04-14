// function sum() {
//     let total = 0;

//     for (i = 0; i < arguments.length; i++) {
//         total += arguments[i];
//     }

//     return total;
// }

function sum(...theArgs) {
    return theArgs.reduce( (prev, curr) => {
        return prev + curr;
    });
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind1 = function (ctx) {
    const fn = this;
    const bindArgs = Array.from(arguments).slice(1);
    return function _boundFn() {
      const callArgs = Array.from(arguments);
      return fn.apply(ctx, bindArgs.concat(callArgs));
    };
  };
  
  Function.prototype.myBind2 = function (ctx, ...bindArgs) {
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
  };

  function curriedSum(args) {
      const nums = [];

      function _curriedSum(num) {
          nums.push(num);

          if (nums.length == args) {
              return nums.reduce( (sum, next) => sum += next);
          } else {
              return _curriedSum;
          }
      }

      return _curriedSum;
  }

// let f1 = curriedSum(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// console.log(f1);
// f1 = f1(20); // [Function]
// console.log(f1);
// f1 = f1(6); // = 30
// console.log(f1);


Function.prototype.curry(numArgs) = function () {
    const args = [];
  
    function _curriedFn(arg) {
        args.push(arg);
        const fn = this;
  
        if (args.length == numArgs) {
            return fn.apply(null, args);
        } else {
            return _curriedFn;
        }
    }
  
    return _curriedFn;
}

Function.prototype.curry(numArgs) = function () {
    const args = [];
  
    function _curriedFn(arg) {
        args.push(arg);
  
        if (args.length == numArgs) {
            return fn(...args);
        } else {
            return _curriedFn;
        }
    }
  
    return _curriedFn;
}