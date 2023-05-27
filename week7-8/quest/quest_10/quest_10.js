// 1. 奇数が含まれるかの判定//
function hasOdd(numbers) {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 === 1) {
      return true;
    }  
  }
  return false;
}
console.log(hasOdd([1, 2, 3, 4, 5]));

// 2. 奇数の抽出 //
function odd(numbers) {
  var odd_numbers = [];
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 === 1) {
      odd_numbers.push(numbers[i]);
    }
  }
  console.log(odd_numbers);
}
odd([1, 2, 3, 4, 5])

// 3. 2乗の計算 //
function square(numbers) {
  var square_numbers = [];
  for (let i = 0; i < numbers.length; i++){
    square_numbers.push(numbers[i] ** 2);
  }
  console.log(square_numbers);
}
square([1, 2, 3, 4, 5])