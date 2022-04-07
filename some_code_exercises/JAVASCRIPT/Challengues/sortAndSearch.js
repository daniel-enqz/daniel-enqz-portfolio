// Given an unsorted array of integers,
// find the target using Binary Search

//STEPS:
//SORT USING SELECTION SORT (ITERATES OVER ARRAY, FINDING INDEX OF LOWEST NUMBER, AND SWAPS OT WITH THE RIGHT POSITION)
// TIME COMPLEXITY: O(n^2) | Ω(n^2)
// SPACE COMPLEXITY O(1)


//BINARY SERCH, GETS THE MEDIUM INDEX OF THE ARRAY AND CHECKS IF GUESS IS HIGHER OR LOWER THAN THE TARGET VALUE
// UPDATES MINIMUM AND MAX VALUES
// TIME COMPLEXITY: O(log n) | Ω(1)
// SPACE COMPLEXITY: O(1)

swap = (array, firstIndex, secondIndex) => {
  temp = array[firstIndex];
  array[firstIndex] = array[secondIndex];
  array[secondIndex] = temp;
}

indexOfMinimum = (array, startIndex) => {
  let minValue = array[startIndex] // => 22
  let minIndex = startIndex // => 0

  for (let i = minIndex + 1; i < array.length; i++) {
    if (array[i] < minValue) {
      minIndex = i;
      minValue = array[i];
    }
  }
  return minIndex;
}


const selectionSort = (array) => {
  let value;
  for (let i = 0; i < array.length; i++) {
    value = indexOfMinimum(array, i)
    swap(array, i, value)
  }
  return array;
}


binarySearch = (array, targetValue) => {
  let min = 0;
  let max = array.length - 1;
  let guess;

  for (let i = 0; i < array.length; i++) {
    guess = Math.floor((min + max) / 2);
    if (array[guess] === targetValue) {
      return guess;
    } else if (array[guess] < targetValue) {
      min = guess + 1
    } else {
      max = guess - 1
    }
  }
  return -1;
}



let targetValue = 42;
let array = [22, 11, 99, 88, 9, 7, 42];

var startTime = performance.now()
const sortedArray = selectionSort(array)
const targetValueIndex = binarySearch(sortedArray, targetValue)
var endTime = performance.now()

console.log(`RUNNING TIME: ${endTime - startTime} TARGET ${targetValue} WAS FOUND AT INDEX ${targetValueIndex} IN SORTED ARRAY:`);
console.log(sortedArray);
