// Array#myEach

Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

arr = [1,2,3]

// arr.myEach( (num) => {
//     console.log(num * 5);
// })


// Array#myMap(callback)

Array.prototype.myMap = function(callback) {
    const mapArr = [];

    this.myEach( (ele) => {mapArr.push(callback(ele))} );

    return mapArr;
}

let map = arr.myMap( (num) => {
    return num * 5;
})

// console.log(map)


// Array#myReduce

Array.prototype.myReduce = function(callback, initialValue) {
    let arr = this;
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1);
      }

    let accumulate = initialValue;

    arr.myEach( ele => {
        accumulate = callback(accumulate, ele);
    })
    return accumulate;
}
console.log(arr.myReduce( (total, item) => total + item));
console.log(arr.myReduce( (accu, el) => accu * el, 2));

