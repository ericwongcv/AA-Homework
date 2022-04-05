// Array#bubbleSort

Array.prototype.bubbleSort = function() {
    let sorted = false;

    while(sorted === false) {
        sorted = true;

        for(let i = 0; i < this.length - 1; i++) {
            if(this[i] > this[i+1]) {
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
};

// console.log([1,3,5,12,1,2,4,2].bubbleSort());


// Array#substrings

// String.prototype.substrings = function() {
//     let substrings = [];

//     for (let i = 0; i < this.length; i++) {
//         for (let j = i + 1; j <= this.length; j++) {
//             let str = this.slice(i, j);
//             substrings.push(str);
//         }
//     }

//     return substrings;
// };

String.prototype.substrings = function() {
    let substrings = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j <= this.length; j++) {
            if (i === j) {
                substrings.push(this[i]);
            } else {
                let str = this.slice(i, j);
                substrings.push(str);
            }
        }
    }

    return substrings;
};

console.log('hello'.substrings());