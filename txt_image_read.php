<?php

//セッション接続
session_start();

// DB接続
include('functions.php');
$pdo = connect_to_db();

//ログインチェック
check_session_id();

// SQL作成&実行
//$sql = 'SELECT * FROM todo_table_kadai';

//like_table1でlikeがついた数をtodo_id毎に集計し、todo_table_kadaiの表とくっつけ一覧にする
$sql = 'SELECT * FROM todo_table_kadai LEFT OUTER JOIN ( SELECT todo_id, COUNT(id) AS like_count FROM like_table1 GROUP BY todo_id ) AS result_table ON todo_table_kadai.id = result_table.todo_id';
$stmt = $pdo->prepare($sql);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

// SQL実行の処理

$user_id = $_SESSION['user_id'];

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
$output = "";
foreach ($result as $record) {

  // $output .= "
  //   <tr>
  //     <td>{$record["updated_at"]}</td>
  //     <td>{$record["title"]}</td>
  //     <td>{$record["todo"]}</td>
  //     <td><img src='{$record["image"]}' alt='Image' width='100'></td>
  //   </tr>
  // ";

//  var_dump($record["todo"]);
//  echo nl2br(htmlspecialchars($record["todo"], ENT_QUOTES, 'UTF-8'));
//  exit();

  $output .= "
    <tr>
      <td><img src='{$record["image"]}' alt='Image' width='100'></td>
      <td>Date:{$record["updated_at"]}<BR>
      Title:{$record["title"]}<BR>
      Todo:{$record["todo"]}</td>
      <td>
        <a href='txt_image_edit.php?id={$record["id"]}'>edit</a><BR>
        <a href='txt_image_delete.php?id={$record["id"]}'>delete</a><BR>
        <a href='like_create.php?user_id={$user_id}&todo_id={$record["id"]}'>check{$record["like_count"]}</a>
      </td>
    </tr>


  ";

}

if ($_SESSION['is_admin'] === 1) {
  $link = "<a href='admin.php'>管理者用</a>";
} else{
  $link = "";
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SQL連携型リスト（一覧画面）</title>
</head>

<body>
  <?= $link ?>
  <fieldset>
    <legend>SQL連携型リスト（一覧画面）---  ログイン中：<?=$_SESSION['username']?> </legend>
    <a href="txt_image_input.php">入力画面</a>
    <a href="logout.php">ログアウト</a>
    <table>
      <thead>
        <tr>
          <!-- <th>update</th>
          <th>title</th>
          <th>todo</th>
          <th>Image</th> -->
          <th>リスト</th>
        </tr>
      </thead>
      <tbody>
        <!-- ここに<tr><td>deadline</td><td>todo</td><tr>の形でデータが入る -->
        <?= $output ?>
      </tbody>
    </table>
  </fieldset>
</body>

</html>