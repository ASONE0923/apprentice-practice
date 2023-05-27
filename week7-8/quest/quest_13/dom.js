// 2. 要素ノードの変更
const tag = window.documentquerySelector('h1');
tag.textContent = 'シンプルブログ';

// 3. イベントハンドラの設定
document.getElementById('post-form').addEventListener('submit', (event) => {
  event.preventDefault();
  
  var title = document.getElementById('title').value;
  var content = document.getElementById('content').value;

  console.log(title);
  console.log(content);
});

// 4. 要素ノードの追加

const handleSubmit = (event) => {
  event.preventDefault(); // デフォルトのフォーム送信をキャンセル

  var title = dovument.getElementById('title').value;
  var content = document.getElementById('content').value;

  var divEl = document.createElement('div');
  var h2El = document.createElement('h2');
  var pEl = document.createElement('p');

  h2El.textContent = title;
  pEl.textContent = content;

  divEl.appendChild(h2El);
  divEl.appendChild(pEl);

  document.getElementById('posts').appendChild(divEl);
  document.getElementById('post-form').reset();
}
document.getElementById('post-form').addEventListener('submit', handleSubmit);

// 5. 要素ノードの削除
document.getElementById('post-form').reset();

// 6. スタイルの変更
const postForm = document.getElementById('post-form');

postForm.addEventListener('mouseenter', function() {
  this.style.backgroundColor = 'yellow';
});

postForm.addEventListener('mouseleave', function() {
  this.style.backgroundColor = 'white';
});

// 7. 要素ノードの削除
const MAX_POSTS = 3; 

function addPost(title, content) {
  const postsContainer = document.getElementById('posts');

  const postDiv = document.createElement('div');
  postDiv.classList.add('post');
  const titleElement = document.createElement('h2');
  titleElement.textContent = title;
  const contentElement = document.createElement('p');
  contentElement.textContent = content;
  postDiv.appendChild(titleElement);
  postDiv.appendChild(contentElement);

  if (postsContainer.children.length >= MAX_POSTS) {
    postsContainer.removeChild(postsContainer.firstChild);
  }

  postsContainer.appendChild(postDiv);
}

function handleSubmit(event) {
  event.preventDefault();
  
  const titleInput = document.getElementById('title');
  const contentInput = document.getElementById('content');
  
  const title = titleInput.value;
  const content = contentInput.value;

  addPost(title, content);

  event.target.reset();
}

const post_Form = document.getElementById('post-form');
post_Form.addEventListener('submit', handleSubmit);
