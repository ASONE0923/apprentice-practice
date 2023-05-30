// ページの読み込みが完了したら実行する
window.addEventListener('DOMContentLoaded', (event) => {
  // 追加ボタンがクリックされたときの処理
  const addButton = document.getElementById('add-button');
  addButton.addEventListener('click', (event) => {
    event.preventDefault(); // ページのリロードを防ぐ

    const todoInput = document.getElementById('todo-input');
    const taskText = todoInput.value;

    if (taskText.trim() !== '') {
      addTask(taskText); // タスクを追加する
      todoInput.value = ''; // テキストボックスを空にする
    }
  });

  // タスクを追加する関数
  function addTask(taskText) {
    const todoList = document.getElementById('todo-list');

    const listItem = document.createElement('li');
    listItem.classList.add('todo-item');

    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.addEventListener('change', (event) => {
      if (event.target.checked) {
        listItem.classList.add('completed');
        taskSpan.style.textDecoration = 'line-through'; // 取り消し線を付ける
      } else {
        listItem.classList.remove('completed');
        taskSpan.style.textDecoration = 'none'; // 取り消し線を解除する
      }
    });

    const taskSpan = document.createElement('span');
    taskSpan.textContent = taskText;

    const deleteButton = document.createElement('button');
    deleteButton.classList.add('delete-button');
    deleteButton.textContent = '削除';
    deleteButton.addEventListener('click', (event) => {
      listItem.remove();
    });

    listItem.appendChild(checkbox);
    listItem.appendChild(taskSpan);
    listItem.appendChild(deleteButton);

    todoList.appendChild(listItem);
  }
});
