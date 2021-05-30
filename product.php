<?php
session_start();
require_once 'classes/Db.class.php';

$db = new Db();

if (isset($_GET['category'])) {
    $productCategory = $db->select(
        'categories',
        ['*'],
        ['id' => $_GET['category']]
    );

    if ($productCategory['parent'] === '0') {
        $subCategories = $db->select('categories', ['*'], ['parent' => $productCategory['id']]);
    } else {
        $productList = $db->select(
            'products',
            ['*'],
            ['categoryId' => $productCategory['id']]
        );
    }
}

if (isset($_GET['product'])) {
    $productData = $db->select(
        'products',
        ['*'],
        ['id' => $_GET['product']]
    );
}

if (isset($_POST['cart'])) {
    $db->insert('cart', [
        'userId' => $_SESSION['user']['id'],
        'product' => $_GET['product']
    ]);

    header('Location: product.php?product=' . $_GET['product'] . '&added');
}

if (isset($_POST['delete-product'])) {
    Db::app()->delete('products', ['id' => $productData['id']]);

    @unlink("$_SERVER[DOCUMENT_ROOT]/$productData[image]");

    header("Location: index.php");
}

require_once 'components/header.php';
?>

<main>
    <div class="container">
        <section class="product">
            <?php if (isset($_GET['category']) && !isset($_GET['product'])) { ?>
                <h1><?= $productCategory['name'] ?></h1>

                <?php if (isset($subCategories)) { ?>
                    <ul class="subcategory">
                        <?php foreach ($subCategories as $subCategory) { ?>
                            <li>
                                <a href="product.php?category=<?= $subCategory['id'] ?>"><?= $subCategory['name'] ?></a>
                            </li>
                        <?php } ?>
                    </ul>
                    <?php
                } else {
                    if ($productList) { ?>
                        <div class="list">
                            <?php foreach ($productList as $product) { ?>
                                <div>
                                    <a href="product.php?product=<?= $product['id'] ?>" class="photo" style="background-image: url(<?= $product['image'] ?>);"></a>
                                    <b class="price"><?= $product['price'] ?> ₸/шт</b>
                                    <a href="product.php?product=<?= $product['id'] ?>" class="desc"><?= $product['name'] ?></a>
                                </div>
                            <?php } ?>
                        </div>
                    <?php
                    } else {
                    ?>
                        <p>😔 Товары отсутствуют</p>
                <?php
                    }
                }
            } else if (isset($_GET['product']) && !isset($_GET['category'])) { ?>
                <p class="back-btn btn with-icon">
                    <i class="material-icons-outlined icon">arrow_back</i> Назад
                </p>
                <h1 class="product"><?= $productData['name'] ?></h1>

                <div class="product-info">
                    <img src="<?= $productData['image'] ?>" alt="Product" class="photo">

                    <div>
                        <p class="price"><b><?= $productData['price'] ?></b> ₸/шт</p>
                        <?php if (isset($_GET['added'])) { ?>
                            <div class="alert">
                                Товар добавлен в <a href="cart.php">корзину</a>
                            </div>
                        <?php } ?>
                        <?php if (!isset($_SESSION['user'])) { ?>
                            <a href="auth.php" class="btn" target="_blank">Войти</a>
                            <p>🗝️ Войдите или зарегистрируйтесь, чтобы добавить товар</p>
                        <?php } else { ?>
                            <?php if (Db::app()->isAdmin()) { ?>
                                <form method="post">
                                    <button name="delete-product" class="btn">Удалить товар</button>
                                </form>
                            <?php } ?>
                            <form method="post">
                                <button class="btn" name="cart">Добавить в корзину</button>
                            </form>
                        <?php } ?>
                    </div>
                </div>
            <?php
            } else {
            ?>
                <p class="back-btn btn with-icon">
                    <i class="material-icons-outlined icon">arrow_back</i> Назад
                </p>
                <h1>Не найдено</h1>
                <p>🤔 Как-ни странно не выбраны ни товары, ни категории</p>
            <?php } ?>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>