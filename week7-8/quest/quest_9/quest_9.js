// 1. 温度チェッカー //
function checkTemperature (t) {
  if (t >= 30) {
    console.log("Hot");
  } else if (t < 30 && t >= 15) {
    console.log("Warm");
  } else {
    console.log("Cold");
  }
}
checkTemperature(30)

// 2. 偶数チェッカー //
function checkOddOrEven(n) {
  if (n % 2 == 0) {
    console.log("Even");
  } else {
    console.log("Odd");
  }
}
checkOddOrEven(2)