// HTML要素の取得
const display = document.getElementById("display");
const buttons = Array.from(document.querySelectorAll("button"));
const clearButton = document.getElementById("clear");
const equalsButton = document.getElementById("equals");

let currentNumber = "";
let operator = null;
let result = null;

// 数字ボタンのクリックイベントの処理
buttons.filter(button => button.classList.contains("digit"))
  .forEach(button => {
    button.addEventListener("click", () => {
      const digit = button.textContent;
      currentNumber += digit;
      display.textContent += digit;
    });
  });

// 四則演算ボタンのクリックイベントの処理
buttons.filter(button => button.classList.contains("operator"))
  .forEach(button => {
    button.addEventListener("click", () => {
      const selectedOperator = button.textContent;
      if (currentNumber !== "") {
        if (result !== null) {
          calculate();
        } else {
          result = parseFloat(currentNumber);
        }
        display.textContent += selectedOperator;
        operator = selectedOperator;
        currentNumber = "";
      }
    });
  });

// イコールボタンのクリックイベントの処理
equalsButton.addEventListener("click", () => {
  if (currentNumber !== "" && operator !== null) {
    calculate();
    display.textContent = result;
    currentNumber = "";
    operator = null;
    result = null;
  }
});

// クリアボタンのクリックイベントの処理
clearButton.addEventListener("click", () => {
  display.textContent = "";
  currentNumber = "";
  operator = null;
  result = null;
});

// 演算の実行
function calculate() {
  const number = parseFloat(currentNumber);
  switch (operator) {
    case "+":
      result += number;
      break;
    case "-":
      result -= number;
      break;
    case "*":
      result *= number;
      break;
    case "/":
      result /= number;
      break;
  }
}
