// Array#uniq

Array.prototype.uniq = function() {
    let arr = []
    for(let i = 0; i < this.length; i++) {
        if(!arr.includes(this[i])) {
            arr.push(this[i]);
        }
    }
    return arr;
}

// let arr = [1,1,3,4,3,5];
// console.log(arr.uniq());


// Array#twoSum with n^2 complexity

Array.prototype.twoSum = function() {
    let pairs = []

    for(let i = 0; i < this.length-1; i++) {
        for(let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                pairs.push([i, j]);
            }
        }
    }
    return pairs;
}

// let arr = [1,-1,3,4,-3,5];
// console.log(arr.twoSum());


// Array#twoSum with O(n) time complexity

Array.prototype.betterTwoSum = function() {
    const pairs = [];
    const hash = {};

    this.forEach((ele, idx) => {
        if (hash[ele * -1] !== undefined) {
            let prevIdx = hash[ele * -1];
            pairs.push([prevIdx, idx]);
        }

        hash[ele] = idx;
    })
    return pairs;
}

// let arr = [1,-1,3,4,-3,5,-5];
// console.log(arr.betterTwoSum());


// Array#transpose

Array.prototype.transpose = function() {
    const transArr = [];
    for (let i = 0; i < this.length; i++){
        for(let j = 0; j < this[0].length; j++) {
            if (i === 0) {
                transArr.push([]);
            }
            transArr[j].push(this[i][j]);            
        }
    }

    return transArr;
}

console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());