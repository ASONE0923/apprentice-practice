#!/bin/bash

while true; do
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
  read choice

  case $choice in
  "Add Password")
    echo "サービス名を入力してください："
    read service_name
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read -s password
    echo "$service_name:$username:$password" >> user_info.txt
    echo "パスワードの追加は成功しました。"
    ;;
  "Get Password")
    echo "サービス名を入力してください"
    read service_name  
    password_info=$(grep "^$service_name:" user_info.txt)

    if  [ -z "$password_info" ]; then
      echo "そのサービスは登録されていません"
    else
      echo "サービス名：$(echo $password_info | cut -d : -f1)"
      echo "ユーザー名：$(echo $password_info | cut -d : -f2)"
      echo "パスワード：$(echo $password_info | cut -d : -f3)"
    fi
    ;;
  "Exit")
    echo "Thank you!"
    break
    ;;
  *)
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  esac
done
