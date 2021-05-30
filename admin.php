<?php

session_start();
require_once 'classes/Db.class.php';

if (!isset($_SESSION['user']) || !Db::app()->isAdmin()) {
    header('Location: index.php');
}

if (isset($_POST['add_product'])) {
    $_POST = array_map('trim', $_POST);

    if (mb_strlen($_POST['name'], 'utf-8') > 255) {
        $errors['product_name'] = 'Максимальная длинна названия продукта - 255 символов';
    }

    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $acceptedFileTypes = [
        'jpg' => 'image/jpeg',
        'png' => 'image/png',
        'gif' => 'image/gif',
        'webp' => 'image/webp'
    ];

    if (false === $ext = array_search(
        $finfo->file($_FILES['image']['tmp_name']),
        $acceptedFileTypes,
        true
    )) {
        $errors['image'] = 'Неверный формат изображения';
    } else {
        $fileLocation = sprintf(
            'assets/img/products/%s.%s',
            sha1_file($_FILES['image']['tmp_name']),
            $ext
        );

        if (!move_uploaded_file(
            $_FILES['image']['tmp_name'],
            $fileLocation
        )) {
            $errors['image'] = 'Не удалось загрузить изображение';
        }
    }

    if (empty($errors)) {
        Db::app()->insert('products', [
            'categoryId' => $_POST['category'],
            'name' => $_POST['name'],
            'image' => $fileLocation,
            'price' => $_POST['price']
        ]);

        header('Location: admin.php?products&added=' . Db::app()->lastInTable('products'));
    }
}

if (isset($_GET['changeStatus'])) {
    Db::app()->update('orders', ['status' => $_GET['status']], ['id' => $_GET['id']]);
    exit;
}

function error($name)
{
    global $errors;
    return isset($errors[$name]) ? $errors[$name] : '';
}

function value($name)
{
    if (isset($_POST[$name])) return $_POST[$name];
    else {
        if (isset($_SESSION['user'][$name])) return $_SESSION['user'][$name];
        else return '';
    }
}

require_once 'components/header.php';

$i = 0;

$categories = array_filter($categories, function ($item) {
    return $item['parent'] > 0;
});

?>

<main>
    <div class="container">
        <section>
            <h1>Панель администратора</h1>

            <div class="admin">
                <ul class="admin-menu">
                    <li class="admin-menu__link">
                        <a href="admin.php?users" class="admin-menu__link btn">Пользователи</a>
                        <?= isset($_GET['users']) ? '<span class="material-icons-outlined">arrow_forward</span>' : '' ?>
                    </li>
                    <li class="admin-menu__link">
                        <a href="admin.php?products" class="admin-menu__link btn">Добавить продукты</a>
                        <?= isset($_GET['products']) ? '<span class="material-icons-outlined">arrow_forward</span>' : '' ?>
                    </li>
                    <li class="admin-menu__link">
                        <a href="admin.php?orders" class="admin-menu__link btn">Заказы</a>
                        <?= isset($_GET['orders']) ? '<span class="material-icons-outlined">arrow_forward</span>' : '' ?>
                    </li>
                </ul>

                <?php if (isset($_GET['users'])) { ?>
                    <div class="admin-block">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>Имя</th>
                                    <th>Администратор</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach (Db::app()->select(['table' => 'users', 'onlyArray' => true], ['email', 'name', 'is_admin']) as $user) { ?>
                                    <tr>
                                        <td><?= ++$i ?></td>
                                        <td><?= $user['email'] ?></td>
                                        <td><?= $user['name'] ?></td>
                                        <td><?= $user['is_admin'] ? 'Да' : 'Нет' ?></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                <?php } ?>

                <?php if (isset($_GET['products'])) { ?>
                    <div class="admin-block">
                        <form method="post" enctype="multipart/form-data">
                            <div class="form-subgroup">
                                <div class="form-group">
                                    <label for="product_name">Название</label>
                                    <input type="text" name="name" id="product_name" required>
                                    <p class="error"><?= error('product_name') ?></p>
                                </div>
                                <div class="form-group">
                                    <label for="price">Цена</label>
                                    <input type="number" name="price" id="price" required>
                                </div>
                            </div>
                            <div class="form-subgroup">
                                <div class="form-group">
                                    <label for="category">Категория</label>
                                    <select name="category" id="category">
                                        <?php foreach ($categories as $category) { ?>
                                            <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="image">Фото</label>
                                    <input type="file" name="image" id="image" required>
                                    <p class="error"><?= error('image') ?></p>
                                </div>
                            </div>
                            <?php if (isset($_GET['added'])) { ?>
                                <div class="form-group">
                                    <div class="alert">
                                        Продукт успешно добавлен. <a href="product.php?product=<?= $_GET['added'] ?>" target="_blank">Посмотреть</a>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="form-group">
                                <div class="btns-container">
                                    <button name="add_product" type="submit" class="btn">Добавить</button>
                                </div>
                            </div>
                        </form>
                    </div>
                <?php } ?>

                <?php if (isset($_GET['orders'])) { ?>
                    <div class="admin-block">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Имя</th>
                                    <th>Email</th>
                                    <th>Продукты</th>
                                    <th>Адрес доставки</th>
                                    <th>Дата заказа</th>
                                    <th>Статус</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach (Db::app()->select(['table' => 'orders', 'onlyArray' => true], ['*']) as $order) { ?>
                                    <tr>
                                        <td><?= ++$i ?></td>
                                        <td><?= Db::app()->select('users', ['name'], ['id' => $order['user_id']])['name'] ?></td>
                                        <td><?= Db::app()->select('users', ['email'], ['id' => $order['user_id']])['email'] ?></td>
                                        <td>
                                            <button class="btn modal-trigger" data-modal="#order<?= $order['id'] ?>">Просмотр</button>


                                            <div class="modal-container" id="order<?= $order['id'] ?>">
                                                <div class="modal">
                                                    <div class="header">
                                                        <p class="title">Продукты</p>
                                                        <button class="icon-btn close modal-trigger" data-modal="#order<?= $order['id'] ?>">
                                                            <i class="material-icons-outlined">close</i>
                                                        </button>
                                                    </div>
                                                    <div class="body">
                                                        <?php foreach (explode(',', $order['products']) as $product) {
                                                            $product = Db::app()->select('products', ['*'], ['id' => $product]);
                                                        ?>
                                                            <?php if (empty($product)) { ?>
                                                                <div class="order-item">
                                                                    <div class="order-item__placeholder"></div>
                                                                    <div class="order-item__texts">
                                                                        <span class="order-item__name">[Товар удален]</span>
                                                                    </div>
                                                                </div>
                                                            <?php } else { ?>
                                                                <a href="product.php?product=<?= $product['id'] ?>" target="_blank" class="order-item">
                                                                    <img src="<?= $product['image'] ?>" class="order-item__photo" />
                                                                    <div class="order-item__texts">
                                                                        <span class="order-item__name"><?= $product['name'] ?></span>
                                                                        <span class="order-item__price"><?= $product['price'] ?> ₸</span>
                                                                    </div>
                                                                </a>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="footer">
                                                        <button class="btn modal-trigger" data-modal="#order<?= $order['id'] ?>">Закрыть</button>
                                                    </div>
                                                </div>
                                                <div class="overlay modal-trigger" data-modal="#order<?= $order['id'] ?>"></div>
                                            </div>
                                        </td>
                                        <td>ул. <?= $order['street'] ?> <?= $order['house'] ?>, <?= $order['apart'] !== '-1' ? 'кв. ' . $order['apart'] : 'частный дом' ?>.</td>
                                        <td><?= date('d.m.Y', $order['created_at']) ?></td>
                                        <td>
                                            <select class="order-status" data-order="<?= $order['id'] ?>">
                                                <option value="0" <?= $order['status'] === '0' ? 'selected' : '' ?>>В обработке</option>
                                                <option value="1" <?= $order['status'] === '1' ? 'selected' : '' ?>>Принят</option>
                                                <option value="2" <?= $order['status'] === '2' ? 'selected' : '' ?>>Доставлен</option>
                                                <option value="3" <?= $order['status'] === '3' ? 'selected' : '' ?>>Отклонен</option>
                                                <option value="4" <?= $order['status'] === '4' ? 'selected' : '' ?>>Возврат</option>
                                                <option value="5" <?= $order['status'] === '5' ? 'selected' : '' ?>>Удален</option>
                                            </select>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                <?php } ?>
            </div>
        </section>
    </div>
</main>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.order-status').forEach(orderStatus => {
            orderStatus.addEventListener('change', () => {
                fetch(`admin.php?changeStatus&status=${orderStatus.value}&id=${orderStatus.dataset.order}`)
            })
        })


        document.querySelectorAll('.modal-trigger').forEach(trigger => {
            trigger.addEventListener('click', () => {
                document.querySelector(trigger.dataset.modal).classList.toggle('show')
                document.querySelector('body').classList.toggle('hidden')
            })
        })
    })
</script>

<?php require_once 'components/footer.php' ?>