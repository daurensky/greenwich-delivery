<?php
session_start();
require_once 'classes/Db.class.php';

if (!isset($_GET['q']) || !$_GET['q']) {
    header('Location: /');
}

$db = new Db();
$userId = $_SESSION['user']['id'];
$results = $db->select([
    'table' => 'products',
    'onlyArray' => true
], ['*'], ['name' => '%' . $_GET['q'] . '%']);

require_once 'components/header.php';
?>

<main>
    <div class="container">
        <section class="search">
            <p class="back-btn btn with-icon">
                <i class="material-icons-outlined icon">arrow_back</i> Назад
            </p>
            <h1>🔎 <?= $_GET['q'] ?></h1>

            <?php if ($results) { ?>
                <div class="products">
                    <?php foreach ($results as $result) { ?>
                        <div>
                            <a href="product.php?product=<?= $result['id'] ?>" class="photo" style="background-image: url(<?= $result['image'] ?>);"></a>
                            <p class="price"><?= $result['price'] ?> ₸/шт</p>
                            <a href="product.php?product=<?= $result['id'] ?>" class="desc"><?= $result['name'] ?></a>
                        </div>
                    <?php } ?>
                </div>
            <?php } else { ?>
                <p style="margin-top: 1rem;">Ничего не найдено</p>
            <?php } ?>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>