#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read service_name
echo "ユーザー名を入力してください："
read username
echo "パスワードを入力してください："
read -s password

echo "$service_name:$username:$password" >> user_info.txt

echo "Thank you!"
