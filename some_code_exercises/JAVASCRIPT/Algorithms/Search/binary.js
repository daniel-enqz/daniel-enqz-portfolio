// For implementing Binary Search, we need to cut the array into 2 each time we fail
// Define min and max(n - 1)
  // While max >= min
  // Compute guess
  // Check if guess = target
  // if it does = {return guess}
  // else if guess < target {min = guess + 1}
  // else (guess > target) {max = guess - 1}
// return -1;

// TIME COMPLEXITY: O(log n) | Ω(1))
// SPACE COMPLEXITY O(1)

// Constant
// Logaritmic
// Linear Functions
// Linearithmic Functions
// Polynomial Functions
// Expoential Functions


binarySearch = (array, targetValue) => {
  let min = 0;
  let max = array.length - 1;
  let guess;

  while (max >= min) {
    guess = Math.floor((max + min)/2);
    if (array[guess] === targetValue) {
      return `${array[guess]} is in the array and at index ${guess}`;
    } else if (array[guess] < targetValue){
      min = guess + 1;
    } else {
      max = guess + 1;
    }
  }
  return -1;
}

let array = [
              2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
              41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
             ];

const targetValue = 59;

console.log(binarySearch(array, targetValue));
