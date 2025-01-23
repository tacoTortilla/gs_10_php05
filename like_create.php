<?php

include('functions.php');

$user_id = $_GET['user_id'];
$todo_id = $_GET['todo_id'];

$pdo = connect_to_db();

//$sql = 'INSERT INTO like_table1 (id, user_id, todo_id, created_at) VALUES (NULL, :user_id, :todo_id, now())';
//データの数のカウント
$sql = 'SELECT COUNT(*) FROM like_table1 WHERE user_id=:user_id AND todo_id=:todo_id';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
$stmt->bindValue(':todo_id', $todo_id, PDO::PARAM_STR);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$like_count = $stmt->fetchColumn();

//データ確認 dbg
//var_dump($like_count);
//exit();

if ($like_count !== 0) {
    // いいねされている状態
    $sql = 'DELETE FROM like_table1 WHERE user_id=:user_id AND todo_id=:todo_id';
  } else {
    // いいねされていない状態
    $sql = 'INSERT INTO like_table1 (id, user_id, todo_id, created_at) VALUES (NULL, :user_id, :todo_id, now())';
  }
  
  // 以下は前項と変更なし
  $stmt = $pdo->prepare($sql);
  $stmt->bindValue(':user_id', $user_id, PDO::PARAM_STR);
  $stmt->bindValue(':todo_id', $todo_id, PDO::PARAM_STR);
  
  try {
    $status = $stmt->execute();
  } catch (PDOException $e) {
    echo json_encode(["sql error" => "{$e->getMessage()}"]);
    exit();
  }


header("Location:txt_image_read.php");
exit();

