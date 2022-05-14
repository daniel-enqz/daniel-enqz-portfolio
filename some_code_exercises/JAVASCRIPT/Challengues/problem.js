//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//Find the sum of all the multiples of 3 or 5 below 1000.

let array = Array.from(Array(1000).keys())
let sum = 0;
for (let i = 1; i < array.length; i++) {
  if (array[i] % 3 === 0 || array[i] % 5 === 0) {
    sum += array[i]
  }
}
console.log(sum);
