// Classic two sum problem.
// Given an array of integers, return two Integers that if sum match the targetValue.

//Brute Force Approach, doing two for loops, check if number1 + number2 = targetValue, if it does add
// those values to empty array en return it.
// Time Complexity: O(n^2)
// Space Complexity: O(1)
const bruteForceApproach = (array, targetSum) => {
  let answer = [];

  for (let i = 0; i < array.length; i++) {
    for (let j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === targetSum) {
        answer.push(array[i], array[j]);
        return answer;
      }
    }
  }
  return answer;
}

//Hash approach, storing each number form the array in a hash.
//Then iterate over array doing, numberChecking = targetSum - curentNumber
// if numberChecking is in hash, return that one,and currentNumber, else, add that number to hash
// Time Complexity: O(n)
// Time Complexity: O(n) (not better than the first in terms of space as it takes extra space to store everything in the JavaScript object.)

const hashApproach = (array, targetSum) => {
  hashNumbers = {}
  let numberChecking;

  for (const number of array) {
    numberChecking = targetSum - number;
    if (numberChecking in hashNumbers) {
      return [numberChecking, number]
    } else {
      hashNumbers[number] = true
    }
  }
  return [];
}

//Sorting approach, with array being sorted.
// Sort array using quicksort
// Define leftPointer and rightPointer. Being the start and end indexes of array
// Define empty answer array to return if no sum gives us the target sum
// If condition (leftPonter + rigthPointer === targetSum) return it
// else if (leftPonter + rigthPointer > targetSum) rightPointer --;
// else if (leftPonter + rigthPointer < targetSum) leftPointer ++;
//Always return an empty array if no sum found.
// Time Complexity: O(n log n)
// Space Complexity: O(1)


const sortApproach = (array, targetSum) => {
  array.sort(function(a, b){return a-b})
  let leftPointer = 0;
  let rightPointer = array.length - 1;

  for (let i = 0; i < array.length; i++) {
    if (array[leftPointer] + array[rightPointer] === targetSum) {
      return [array[leftPointer], array[rightPointer]]
    } else if (array[leftPointer] + array[rightPointer] > targetSum){
      rightPointer --;
    } else if (array[leftPointer] + array[rightPointer] < targetSum) {
      leftPointer ++;
    }
  }
  return [];
}


const array = [1, 2, 3, 4, 5]
const targetSum = 7

var startTime = performance.now()
console.log(bruteForceApproach(array, targetSum));
var endTime = performance.now()
console.log(`Bruteforce: took ${endTime - startTime} milliseconds | USING: O(n^2)`)

var startTime = performance.now()
console.log(hashApproach(array, targetSum));
var endTime = performance.now()
console.log(`Hash: ${endTime - startTime} milliseconds | USING: O(n)`)

var startTime = performance.now()
console.log(sortApproach(array, targetSum));
var endTime = performance.now()
console.log(`Sorting: ${endTime - startTime} milliseconds | USING: O(n log n)`)
