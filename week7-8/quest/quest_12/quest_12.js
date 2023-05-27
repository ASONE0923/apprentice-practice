// 1. 書籍プリンター 
function printBooks(books) {
  for (let i = 0; i < books.length; i++){
  console.log( `『${books[i].title}』 ${books[i].author}`);
  }
}

books = [
  { title: "JavaScript入門", author: "山田太郎" },
  { title: "JavaScriptの絵本", author: "山田次郎" }
];
printBooks(books)

// 2. ユーザーパーミッションチェッカー 
let users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '清水',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: true
    }
  }
];

function checkPermission(username, permission) {
  for (let i = 0; i < users.length; i++) {
    if (users[i].username === username) {
      return users[i].permissions[permission] === true;
    }
  }
  return false;
}

console.log(checkPermission('山田', 'canWrite'));
