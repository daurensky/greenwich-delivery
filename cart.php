<?php
session_start();
require_once 'classes/Db.class.php';

$db = new Db();
$userId = $_SESSION['user']['id'];
$cart = $db->select([
    'table' => 'cart',
    'onlyArray' => true
], ['id', 'product'], ['userId' => $userId]);

$total = 0;

if (isset($_POST['remove'])) {
    $db->delete('cart', ['id' => $_POST['id']]);
    header('Location: cart.php');
}

if (isset($_GET['process'])) {
    $db->delete('cart', ['userId' => $userId]);
    header('Location: cart.php?processed');
}

require_once 'components/header.php';
?>

<main>
    <div class="container">
        <section class="cart">
            <h1>Корзина</h1>

            <?php if ($cart) { ?>
                <ul>
                    <?php
                    foreach ($cart as $item) {
                        $product = $db->select('products', ['*'], ['id' => $item['product']]);
                        $total += intval($product['price']);
                    ?>
                        <li>
                            <a href="product.php?product=<?= $product['id'] ?>">
                                <div class="photo" style="background-image: url(<?= $product['image'] ?>);"></div>
                                <p class="name"><?= $product['name'] ?> • <?= $product['price'] ?> ₸/шт</p>
                                <form class="remove" method="post">
                                    <input type="hidden" name="id" value="<?= $item['id'] ?>">
                                    <button type="submit" name="remove" class="icon-btn">
                                        <i class="material-icons-outlined">delete_forever</i>
                                        Удалить из корзины
                                    </button>
                                </form>
                            </a>
                        </li>
                    <?php } ?>
                </ul>

                <p class="total">Итого • <?= $total ?>₸</p>

                <a href="cart.php?process" class="btn">Оформить заказ</a>
                <?php
            } else {
                if (isset($_GET['processed'])) {
                ?>
                    <div class="alert">
                        Заказ оформлен. Спасибо за покупку!
                    </div>
                <?php } else { ?>
                    <p>На данный момент корзина пуста. Пора бы добавить немножко товаров 🍎🍎🍎</p>
            <?php
                }
            }
            ?>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>