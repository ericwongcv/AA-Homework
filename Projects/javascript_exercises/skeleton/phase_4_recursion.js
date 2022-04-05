// Phase 4: Recursion

// range(start, end)

function range(start, end) {
    if (start === end) {
        return [];
    }

    let arr = [start];
    arr = arr.concat(range(start + 1, end))
    return arr;
};

// console.log(range(-10,5));


// sumRec(arr)

function sumRec(arr) {
    if (arr.length === 0) {
        return 0;
    }

    let last = arr.pop();
    return last + sumRec(arr);
};

// console.log(sumRec([5, 3, 4, 2, 1]));


// exponent(base, exp)

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    }

    return base * exponent(base, exp - 1);
};

function exponent2(base, exp) {
    if (exp === 0) {
        return 1;
    } else if (exp == 1) {
        return base;
    } else if (exp % 2 === 0) {
        return exponent2(base, n/2) ** 2;
    } else if (exp % 3 === 0) {
        return base * exponent2(base, (exp-1)/2) ** 2;
    }
};

// console.log(exponent(3, 3));
// console.log(exponent2(3, 3));


// fibonacci(n)

function fibonacci(n) {
    if (n === 1) {
        return [0];
    } else if (n === 2) {
        return [0, 1];
    }
    let arr = fibonacci(n-1);
    arr.push(arr[arr.length - 1] + arr[arr.length - 2])
    return arr;
};

// console.log(fibonacci(10));

function deepDup(arr) {
    if (!(arr instanceof Array)) {
        return arr;
    }

    arr.map(ele => {
        return deepDup(ele);
    });
};

// const array = [[2],3];
// const dupedArray = deepDup(array);
// console.log(dupedArray);

function bsearch(arr, target) {
    if (arr.length === 0) {
        return -1;
    }

    let mid = Math.floor(arr.length / 2);
    

    if (target === arr[mid]) {
        return mid;
    } else if (target < arr[mid]) {
        let left = arr.splice(0, mid);
        return bsearch(left, target);
    } else {
        
        let right = arr.splice(mid + 1, arr.length - 1);

        return bsearch(right, target) === -1 ? -1 : bsearch(right, target) + mid + 1;
    }
};

// console.log(bsearch([1,2,3,4,5,54], 54));

function merge(left, right) {
    const merged = [];

    while (left.length > 0 && right.length > 0) {
        let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
        merged.push(nextItem);
    }
    return merged.concat(left, right);
}

function mergeSort(arr) {
    if (arr.length === 1) {
        return arr;
    }

    const mid = Math.floor(arr.length / 2);
    const left = mergeSort(arr.slice(0, mid));
    const right = mergeSort(arr.slice(mid));

    return merge(left, right);
};

// console.log(`mergeSort([4, 5, 2, 3, 1]) = ${mergeSort([4, 5, 2, 3, 1])}`);


// subsets
function subsets(array) {
    if (array.length === 0) {
        return [[]];
    }

    const first = array[0];
    const theRest = subsets(array.splice(1));

    const firstIncluded = theRest.map(ele => [first].concat(ele));
    return theRest.concat(firstIncluded);
  }
  
  console.log(`subsets([1, 3, 5]) = ${JSON.stringify(subsets([1, 3, 5]))}`);