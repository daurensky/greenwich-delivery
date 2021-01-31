<?php
require_once 'classes/Db.class.php';

$user = $_SESSION['user'];
$db = new Db();

$categories = $db->select('categories', ['*'])
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="shortcut icon" href="assets/favicon.ico" type="image/x-icon" />

    <title>Greenwich</title>
</head>

<body>
    <header>
        <div class="container">
            <div class="logo">
                <p class="icon-btn menu-btn">
                    <i class="material-icons-outlined">menu</i>
                </p>

                <div class="catalog">
                    <div class="logo">
                        <div class="col">
                            <span>Greenwich онлайн доставка 🧔👶👩</span>
                        </div>
                        <div class="col">
                            <span>Greenwich онлайн доставка 🧔👶👩</span>
                        </div>
                        <div class="col">
                            <span>Greenwich онлайн доставка 🧔👶👩</span>
                        </div>
                    </div>

                    <div class="main">
                        <div class="header">
                            <p class="text">Каталог товаров</p>
                            <p class="icon-btn menu-btn">
                                <i class="material-icons-outlined">close</i>
                                Закрыть
                            </p>
                        </div>
                        <ul>
                            <?php
                            foreach ($categories as $category) {
                                if ($category['parent'] > 0) continue;
                            ?>
                                <li>
                                    <a href="product.php?category=<?= $category['id'] ?>"><?= $category['name'] ?></a>
                                    <ul>
                                        <?php
                                        foreach ($categories as $subCategory) {
                                            if ($category['id'] !== $subCategory['parent']) continue;
                                        ?>
                                            <li>
                                                <a href="product.php?category=<?= $subCategory['id'] ?>" <?= isset($_GET['category']) && $_GET['category'] === $subCategory['id'] ? 'class="active"' : '' ?>>
                                                    <?= $subCategory['name'] ?>
                                                </a>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <a href="/">
                    <h1>
                        Gre<span style="color: #ffb74d">e</span>nwich
                    </h1>
                </a>
            </div>
            <div class="search">
                <form action="search.php" method="GET">
                    <input class="search" type="text" name="q" placeholder="Поиск..." value="<?= isset($_GET['q']) ? $_GET['q'] : '' ?>" />
                    <button>
                        <i class="material-icons-outlined">search</i>
                    </button>
                </form>
            </div>
            <div class="cabinet">
                <a href="cart.php" class="icon-btn">
                    <i class="material-icons-outlined">shopping_cart</i>
                    Корзина
                </a>
                <a href="<?= $user ? 'cabinet.php' : 'auth.php' ?>" class="cabinet-btn icon-btn">
                    <i class="material-icons-outlined icon">person</i>
                    <p><?= $user['name'] ?? 'Личный кабинет' ?></p>
                </a>
            </div>
        </div>
    </header>