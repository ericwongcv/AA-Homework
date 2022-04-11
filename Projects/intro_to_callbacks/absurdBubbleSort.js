const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function askIfGreaterThan(el1, el2, callback) {
    reader.question(
        `Is ${el1} > than ${el2}? ('yes' or 'no'): `,
        ans => {
        ans === 'yes' ? callback(true) : callback(false);
    })    
}

// function callback(el) {
//     if (el === true) {
//         console.log('yeah');
//     } else {
//         console.log('nope');
//     }
// }

// console.log(askIfGreaterThan(2, 3, callback))

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
            if (isGreaterThan) {
                const tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;

                madeAnySwaps = true;
            }

            innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
        });
    }

    if (i == (arr.length - 1)) {
        outerBubbleSortLoop(madeAnySwaps);
    }
}

// function outerBubbleSortLoop(ele) {
//     if (ele) {
//         console.log(innerBubbleSortLoop);
//     }
// }

// innerBubbleSortLoop([5,2,4], 0, false, outerBubbleSortLoop)

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    }
    outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
  });