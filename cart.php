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

if (isset($_POST['process'])) {
    $cartStr = [];

    foreach ($cart as $cartItem) {
        $cartStr[] = $cartItem['product'];
    }

    Db::app()->insert('orders', [
        'user_id' => $userId,
        'products' => implode(',', $cartStr),
        'street' => $_POST['street'],
        'house' => $_POST['house'],
        'apart' => $_POST['apart'] ?: -1,
        'status' => 0,
        'created_at' => time()
    ]);

    $db->delete('cart', ['userId' => $userId]);

    header('Location: cart.php?processed');
}

function error($name)
{
    global $errors;
    return isset($errors[$name]) ? $errors[$name] : '';
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

                <form method="POST">
                    <div class="form-group">
                        <label for="street">Улица</label>
                        <input type="text" name="street" id="street" required>
                        <p class="error"><?= error('product_name') ?></p>
                    </div>
                    <div class="form-group">
                        <label for="house">Дом</label>
                        <input type="number" name="house" id="house" required>
                    </div>
                    <div class="form-group">
                        <label for="apart">Квартира (если есть)</label>
                        <input type="number" name="apart" id="apart">
                    </div>

                    <button name="process" type="submit" class="btn">Оформить заказ</button>
                </form>
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