// function mysteryScoping1() {
//     var x = 'out of block';
//     if (true) {
//       var x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }
  
//   function mysteryScoping2() {
//     const x = 'out of block';
//     if (true) {
//       const x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }
  
//   function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//       var x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }
  
//   function mysteryScoping4() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     console.log(x);
//   }
  
//   function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
//   }

function madLib(arg1, arg2, arg3) {
    console.log(`We shall ${arg1.toUpperCase()} the ${arg2.toUpperCase()} ${arg3.toUpperCase()}.`);
}

// madLib('make', 'best', 'guac');

const isSubstring = (searchString, subString) => {
    return searchString.includes(subString) ? true : false
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
    return array.filter(num => (num % 3 === 0 || num % 5 === 0) && !(num % 3 === 0 && num % 5 === 0));
}

// console.log(fizzBuzz([3, 5, 10, 15]));

function isPrime(number) {
    if(number <= 1){
        return false;
    } else if(number === 2) {
        return true;
    }
    for(let i = 2; i < number; i++) {
        if(number % i === 0) {
            return false;
        }
    }
    return true;
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(n) {
    if(n === 0) {
        return 0
    }

    let primeStore = []
    
    for(let i = 2; primeStore.length < n; i++) {
        if(isPrime(i)) {
            primeStore.push(i);
        }
    }
    return primeStore.reduce((accumulate, term) => accumulate + term);
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(1));
// console.log(sumOfNPrimes(4));