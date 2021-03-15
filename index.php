<?php
session_start();
require_once 'classes/Db.class.php';

var_dump($_SESSION);

$db = new Db();

$products = $db->select([
    'table' => 'products',
    'onlyArray' => true
], ['*'], null, 'price LIMIT 8');

require_once 'components/header.php'
?>

<main>
    <div class="container">
        <div class="info">
            <p>
                <i class="material-icons-outlined">call</i> +7 707
                138-51-85
            </p>
            <p>
                <i class="material-icons-outlined">query_builder</i>
                С 10:00 до 20:00
            </p>
            <p>
                <i class="material-icons-outlined">email</i>
                online@greenwich.kz
            </p>
        </div>

        <section>
            <p class="title">Акции</p>
            <div class="banners">
                <a><img src="assets/img/water_gift.jpg" alt="Banner" /></a>
            </div>
        </section>

        <section>
            <p class="title">Товары со скидками</p>
            <div class="products">
                <?php foreach ($products as $product) { ?>
                    <div>
                        <a href="product.php?product=<?= $product['id'] ?>" class="photo" style="background-image: url(<?= $product['image'] ?>);"></a>
                        <b class="price"><?= $product['price'] ?> ₸/шт</b>
                        <a href="product.php?product=<?= $product['id'] ?>" class="desc">
                            <?= $product['name'] ?>
                        </a>
                    </div>
                <?php } ?>
            </div>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>